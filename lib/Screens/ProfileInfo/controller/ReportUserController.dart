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

class ReportUserController extends GetxController {

  var preferences = MySharedPref();
  RxString token = "".obs;
  Rx<SigninModel> profileModel= SigninModel().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // TODO: implement onInit
    print("init State");

    await userInfoModel();
    // reportUserProfileAPI();
  }

  reportUserProfileAPI(BuildContext context) async {
    String url = urlBase + urlPostReportUser;

    if(token.value==null){
      Get.offAll(SignIn());
    }

    final apiReq = Request();
    await apiReq.postAPI(url, null, token.value).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("User Profile Report message", model.message.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            reportUserProfileAPI(context);
          }
          else if (model.statusCode == 200) {
            Navigator.pop(context); //pop dialog
            await snackBar(context, model.message);
            printData("User Profile Report status", model.statusCode.toString());

          } else {
            printData("User Profile Report status", model.statusCode.toString());
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

   userInfoModel() async {
    //User Personal details
    profileModel.value =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);

    token.value = profileModel.value.data.token;
   }

}
