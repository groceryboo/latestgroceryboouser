import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/view/UserNameView.dart';
import 'package:groceryboouser/Screens/Dashboard/view/BottomNavigation.dart';
import 'package:groceryboouser/Screens/Homepage/view/HomepageView.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:http/http.dart' as http;

class SocialMediaSigninController extends GetxController {
  var _googleSigin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount>(null);

  Map<String, dynamic> facebookData;

  googleLogin(BuildContext context) async {
    googleAccount.value = await _googleSigin.signIn();

    if (googleAccount.value != null) {
      callSocialLoginAPI(context, "google");
    }
  }

  googleLogout() async {
    googleAccount.value = await _googleSigin.signOut();
  }

  Future<void> callSocialLoginAPI(BuildContext context, String loginBy) async {
    if (loginBy == "google") {
      onLoading(context, "Loading...");
      String url = urlBase + urlPostSocialLogin;
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({
        'social_type': loginBy,
        'social_id': googleAccount.value.id,
        'name': googleAccount.value.displayName.toString(),
        'email': googleAccount.value.email.toString()
      });

      print("Social " + googleAccount.value.id);
      print("Social " + googleAccount.value.displayName.toString());
      print("Social " + googleAccount.value.email.toString());

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        await response.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 200) {
            snackBar(context, model.message);
            SigninModel signUp = SigninModel.fromJson(userModel);

            var preferences = MySharedPref();
            await preferences.setSignInModel(
                signUp, SharePreData.key_SaveSignInModel);

            Navigator.pop(context); //pop dialog
            Get.to(UserName());
          } else if (model.statusCode == 101) {
            snackBar(context, model.message);
            googleLogout();
            Navigator.pop(context); //pop dialog
          }
        });
      } else {
        print("Response Null" + response.reasonPhrase.toString());
      }
    } else {
      onLoading(context, "Loading...");
      String url = urlBase + urlPostSocialLogin;
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({
        'social_type': loginBy,
        'social_id': facebookData["id"].toString(),
        'name': facebookData["name"].toString(),
        'email': facebookData["email"].toString()
      });

      print("Social " + facebookData["id"].toString());
      print("Social " + facebookData["picture"]["data"]["url"].toString());
      print("Social " + facebookData["name"].toString());
      print("Social " + facebookData["email"].toString());

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        await response.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 200) {
            snackBar(context, model.message);
            SigninModel signUp = SigninModel.fromJson(userModel);

            var preferences = MySharedPref();
            await preferences.setSignInModel(
                signUp, SharePreData.key_SaveSignInModel);

            Navigator.pop(context); //pop dialog
            Get.to(UserName());
          } else if (model.statusCode == 101) {
            snackBar(context, model.message);
            googleLogout();
            Navigator.pop(context); //pop dialog
          }
        });
      } else {
        print("Response Null" + response.reasonPhrase.toString());
      }
    }
  }
}
