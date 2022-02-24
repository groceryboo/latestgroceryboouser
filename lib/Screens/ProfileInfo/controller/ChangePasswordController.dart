import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Dashboard/view/BottomNavigation.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:http/http.dart' as http;

class ChangePasswordController extends GetxController {

  var preferences = MySharedPref();

  Rx<TextEditingController> currentPswdText = TextEditingController().obs;
  Rx<TextEditingController> newPswdText = TextEditingController().obs;
  Rx<TextEditingController> confirmPswdText = TextEditingController().obs;

  RxString token = "".obs;
  Rx<SigninModel> profileModel= SigninModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init State");

    userInfoModel();
  }

  changePasswordAPI(BuildContext context) async {
    token.value = profileModel.value.data.token;
    print("Token "+ token.value);

    onLoading(context, "Updating..");

    String url = urlBase + urlPostChangePassword;

    dynamic body = {
      'old_password': currentPswdText.value.text,
      'new_password': newPswdText.value.text,
    };

    final apiReq = Request();
    await apiReq.postAPI(url, body, token.value).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("Change password message", model.message.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            changePasswordAPI(context);
          } else if (model.statusCode == 200) {
            SigninModel userInfo =
            SigninModel.fromJson(userModel);

            profileModel.value.data.password = newPswdText.value.text;
            await preferences.setSignInModel(profileModel.value, SharePreData.key_SaveSignInModel);

            snackBar(context, userInfo.message);
            Navigator.pop(context); //pop dialog

            Get.off(() => BottomNavigation());

          } else {
            printData("User Profile status", model.statusCode.toString());
            Navigator.pop(context); //pop dialog
            await snackBar(context, model.message);
          }
        });
      } else {
        print(res.reasonPhrase);
        // Navigator.pop(context); //pop dialog
      }
    });
  }

  Future<void> userInfoModel() async {
    //User Personal details
    profileModel.value =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);

  }

}
