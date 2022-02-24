import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Authentication/SignIn/view/signinview.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/view/PasswordView.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/view/UserNameView.dart';
import 'package:groceryboouser/Screens/Dashboard/view/BottomNavigation.dart';
import 'package:groceryboouser/Screens/Homepage/view/HomepageView.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:http/http.dart' as http;


class SigninController extends GetxController {
  Rx<TextEditingController> inputText = TextEditingController().obs;
  Rx<TextEditingController> pswdText = TextEditingController().obs;

  callSigninApi(BuildContext context) async {
    String url = urlBase + urlGetLogin;
    final apiReq = Request();

    dynamic body = {
      'value': inputText.value.text,
      'password': pswdText.value.text
    };

    await apiReq.postAPIwithoutBearer(url, body).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          print("status code "+ model.statusCode.toString());
          print("status code "+ model.message.toString());

          if (model.statusCode == 200) {
            snackBar(context, model.message);
            SigninModel signInModel = SigninModel.fromJson(userModel);
            var preferences = MySharedPref();
            await preferences.setSignInModel(
                signInModel, SharePreData.key_SaveSignInModel);
            await preferences.setBool(SharePreData.key_isLocationServiceEnabled, false);

            Navigator.pop(context); //pop dialog
            if (signInModel.data.userName == null) {
              Get.offAll(UserName());
            } else if (signInModel.data.password == null) {
              Navigator.pop(context); //pop dialog
              Get.offAll(Password());
            } else {
              // Navigator.pop(context); //pop dialog
              Get.offAll(BottomNavigation());
            }
          } else {
            Navigator.pop(context);
            Get.offAll(SignIn()); //pop dialog
            snackBar(context, model.message);
          }
        });
      } else if (res.statusCode == 101) {
        Navigator.pop(context); //pop dialog
        snackBar(context, "Enter valid Credentials");
      }
    });
  }

}
