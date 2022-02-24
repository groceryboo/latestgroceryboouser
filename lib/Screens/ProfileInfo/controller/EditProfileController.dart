import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Authentication/SignIn/view/signinview.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:http/http.dart' as http;

class EditProfileController extends GetxController {

  var preferences = MySharedPref();

  Rx<TextEditingController> editNameText = TextEditingController().obs;
  Rx<TextEditingController> editUserNameText = TextEditingController().obs;
  Rx<TextEditingController> editWebsiteText = TextEditingController().obs;
  Rx<TextEditingController> editBioText = TextEditingController().obs;

  RxString strImage= "".obs;
  RxString strToken= "".obs;
  Rx<SigninModel> signinModel = SigninModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init State");
    userInfoModel();
  }

  editUserProfileAPI(BuildContext context) async {
    onLoading(context, "Updating..");

    String url = urlBase + urlPostEditUserProfile;

    dynamic body = {
      'first_name': editNameText.value.text,
      'user_name': editUserNameText.value.text,
      'website': editWebsiteText.value.text,
      'bio_data': editBioText.value.text,
    };

    final apiReq = Request();
    await apiReq.postAPI(url, body, strToken.value).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("Edit Profile message", model.message.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            editUserProfileAPI(context);
          } else if (model.statusCode == 200) {
            SigninModel profileModel = SigninModel.fromJson(userModel);
            printData("Edit user message", model.message.toString());

            signinModel.value.data.firstName = editNameText.value.text;
            signinModel.value.data.userName = editUserNameText.value.text;
            signinModel.value.data.website = editWebsiteText.value.text;
            signinModel.value.data.bioData = editBioText.value.text;
            signinModel.value.data.image = profileModel.data.image;

            await preferences.setSignInModel(signinModel.value, SharePreData.key_SaveSignInModel);

            snackBar(context, profileModel.message);
            Navigator.pop(context,true); //pop dialog
            Get.back();

          } else {
            printData("User Profile status", model.statusCode.toString());
            Navigator.pop(context); //pop dialog
            await snackBar(context, model.message);
          }

        });
      } else {
        print(res.reasonPhrase);
        Navigator.pop(context); //pop dialog
      }

    });
  }

  Future<void> userInfoModel() async {
    //User Personal details

    signinModel.value =
        await preferences.getSignInModel(SharePreData.key_SaveSignInModel);

    editNameText.value.text = signinModel.value.data.firstName;
    editUserNameText.value.text = signinModel.value.data.userName;
    editWebsiteText.value.text = signinModel.value.data.website;
    editBioText.value.text = signinModel.value.data.bioData;

    strImage.value = signinModel.value.data.image;
    strToken.value = signinModel.value.data.token;


  }
}
