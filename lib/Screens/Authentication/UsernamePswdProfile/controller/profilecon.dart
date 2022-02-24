import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/view/PasswordView.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/view/PermissionView.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/view/SyncContactsView.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  Rx<TextEditingController> userNameText = TextEditingController().obs;
  Rx<TextEditingController> passwordText = TextEditingController().obs;
  dynamic body;

  // Future<void> callUsernamePswdApi(BuildContext context, String flow) async {
  //   var preferences = MySharedPref();
  //
  //   SigninModel? modelM = await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
  //   var token = modelM?.data.token;
  //
  //   var headers = {'Authorization': 'Bearer ' + token!};
  //   var request =
  //       http.MultipartRequest('POST', Uri.parse(urlBase + urlPostEditProfile));
  //
  //   if (flow == "1") {
  //     request.fields.addAll({'user_name': userNameText.value.text});
  //   } else {
  //     request.fields.addAll({'password': passwordText.value.text});
  //   }
  //
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     await response.stream.bytesToString().then((value) async {
  //       String strData = value;
  //       Map<String, dynamic> userModel = json.decode(strData);
  //       BaseModel model = BaseModel.fromJson(userModel);
  //
  //       if (model.statusCode == 200) {
  //         snackBar(context, "Successfully added");
  //         SigninModel? signUp =
  //         await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
  //
  //         if (flow == "1") {
  //           signUp!.data.userName = userNameText.value.text;
  //           await preferences.setSignInModel(signUp,SharePreData.key_SaveSignInModel);
  //           Get.offAll(Password());
  //         }
  //         else {
  //           signUp!.data.password = passwordText.value.text;
  //           await preferences.setSignInModel(signUp,SharePreData.key_SaveSignInModel);
  //           Get.offAll(Permission());
  //         }
  //       } else if (model.statusCode == 101) {
  //         snackBar(context, model.message);
  //       } else {
  //         snackBar(context, "Choose another username");
  //       }
  //     });
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }

  Future<void> callProfileApi(BuildContext context, String imagePath) async {
    onLoading(context, "Loading..");
    var preferences = MySharedPref();
    SigninModel modelM =
        await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = modelM?.data.token;

    var headers = {'Authorization': 'Bearer ' + token};
    var request =
        http.MultipartRequest('POST', Uri.parse(urlBase + urlPostEditProfile));

    request.files.add(await http.MultipartFile.fromPath('image', imagePath));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) async {
        String strData = value;
        Map<String, dynamic> userModel = json.decode(strData);
        BaseModel model = BaseModel.fromJson(userModel);

        if (model.statusCode == 500) {
          final tokenUpdate = TokenUpdateRequest();
          await tokenUpdate.updateToken();
          printData("create address", "Token Updated");
          callProfileApi(context, imagePath);
        }
        else if (model.statusCode == 200) {
          Navigator.pop(context); //pop dialog
          snackBar(context, model.message);
          SigninModel signIn = SigninModel.fromJson(userModel);
          modelM.data.image = signIn.data.image;
          await preferences.setSignInModel(
              modelM, SharePreData.key_SaveSignInModel);

          Get.offAll(() => SyncContacts());
        }
        else {
          Navigator.pop(context); //pop dialog
          snackBar(context, model.message);
        }
      });
    } else {
      Navigator.pop(context); //pop dialog
      print(response.reasonPhrase);
    }
  }

  callUsernamePswdApi(BuildContext context, String flow) async {
    onLoading(context, "Loading..");
    var preferences = MySharedPref();
    SigninModel modelM =
        await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = modelM?.data.token;

    String url = urlBase + urlPostEditProfile;
    final apiReq = Request();
    if (flow == "1") {
      body = {'user_name': userNameText.value.text};
    } else {
      body = {'password': passwordText.value.text};
    }
    await apiReq.postAPI(url, body, token).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();
            printData("create address", "Token Updated");
            callUsernamePswdApi(context, flow);
          } else if (model.statusCode == 200) {
            Navigator.pop(context); //pop dialog
            snackBar(context, model.message);
            SigninModel signUp = await preferences
                .getSignInModel(SharePreData.key_SaveSignInModel);

            if (flow == "1") {
              signUp.data.userName = userNameText.value.text;
              await preferences.setSignInModel(
                  signUp, SharePreData.key_SaveSignInModel);
              Get.offAll(Password());
            } else {
              Navigator.pop(context); //pop dialog
              signUp.data.password = passwordText.value.text;
              await preferences.setSignInModel(
                  signUp, SharePreData.key_SaveSignInModel);
              Get.offAll(Permission());
            }
          } else {
            Navigator.pop(context); //pop dialog
            snackBar(context, model.message);
          }
        });
      }
      else {
        Navigator.pop(context); //pop dialog
      }
    });
  }
}
