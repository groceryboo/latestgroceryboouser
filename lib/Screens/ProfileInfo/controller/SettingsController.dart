import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:http/http.dart' as http;

class SettingsController extends GetxController {
  var preferences = MySharedPref();

  Rx<TextEditingController> phoneText = TextEditingController().obs;
  Rx<TextEditingController> emailText = TextEditingController().obs;

  RxBool boolPushNotification = false.obs;
  RxBool boolLocationServices = false.obs;

  RxString strImage = "".obs;
  RxString strToken = "".obs;

  RxString notificationCode = "0".obs;
  Rx<SigninModel> signinModel = SigninModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init State");
    userInfoModel();
  }

  editUserProfileAPI(BuildContext context) async {
    onLoading(context, "Updating...");
    String url = urlBase + urlPostEditUserProfile;

    if(boolPushNotification.value == true){
      notificationCode.value = "1";
    }else{
     notificationCode.value = "0";
    }

    dynamic body = {
      'push_notification': notificationCode.value,
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
            signinModel.value.data.isPushNotification = notificationCode.value;

            await preferences.setSignInModel(
                signinModel.value, SharePreData.key_SaveSignInModel);
            Navigator.pop(context); //pop dialog

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

    phoneText.value.text = signinModel.value.data.phoneNumber;
    emailText.value.text = signinModel.value.data.email;

    strImage.value = signinModel.value.data.image;
    strToken.value = signinModel.value.data.token;

    if (signinModel.value.data.isPushNotification == 0) {
      boolPushNotification.value = false;
    } else {
      boolPushNotification.value = true;
    }

    boolLocationServices.value = preferences.getBoolValue(SharePreData.key_isLocationServiceEnabled);

    print("boolLocationServices"+ boolLocationServices.value.toString());

  }

  locationServicesAction(){
    preferences.setBool(SharePreData.key_isLocationServiceEnabled, boolLocationServices.value);

  }

}
