import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/view/emailverificationview.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/view/phoneverificationview.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/view/UserNameView.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:http/http.dart' as http;


class SignupController extends GetxController {
  Rx<TextEditingController> emailText = TextEditingController().obs;
  Rx<TextEditingController> phoneText = TextEditingController().obs;
  Rx<TextEditingController> emailVeriCodeText = TextEditingController().obs;
  Rx<TextEditingController> phoneVeriCodeText = TextEditingController().obs;

  Future<void> callSignupApi(BuildContext context, String type) async {
    onLoading(context,"Loading..");
    String url = urlBase + urlPostRegister;
    var request = http.MultipartRequest('POST', Uri.parse(url));

    var preferences = MySharedPref();

    if (type == SharePreData.key_email) {
      request.fields.addAll({"email": emailText.value.text});
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        await response.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);
          Navigator.pop(context); //pop dialog

          if(model.statusCode==200){
            SigninModel signUp = SigninModel.fromJson(userModel);
            await preferences.setSignInModel(signUp,SharePreData.key_SaveSignInModel);

            // SigninModel? modelM = await preferences.getSignUpModel(SharePreData.key_SaveSignupModel);
            // print("modelM " + modelM!.data.id.toString());
            // print("modelM " + modelM.message.toString());

            snackBar(context, "Code Sent");
            Get.offAll(ConfirmationCode());
          }else if(model.statusCode==101){
            snackBar(context, model.message);
          }else{
            snackBar(context,"Use another email");
          }
        });
      } else {
        Navigator.pop(context); //pop dialog
        snackBar(context, response.reasonPhrase);
      }
    } else {
      request.fields.addAll({"phone_number": phoneText.value.text});
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        await response.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);
          Navigator.pop(context); //pop dialog
          if(model.statusCode==200){
            SigninModel signUp = SigninModel.fromJson(userModel);
            await preferences.setSignInModel(signUp,SharePreData.key_SaveSignInModel);

            snackBar(context, "Code Sent");
            Get.offAll(OtpVerification());
          }else if(model.statusCode==101){
            snackBar(context, model.message);
          }else{
            snackBar(context,"Use another number");
          }

        });
      } else {
        Navigator.pop(context); //pop dialog
        snackBar(context, response.reasonPhrase);
      }
    }
  }

  Future<void> callEmailVerificationApi(BuildContext context) async {
    onLoading(context,"Loading..");
    var preferences = MySharedPref();
    SigninModel model = await preferences.getSignInModel(SharePreData.key_SaveSignInModel);

    String url = urlBase + urlPostEmailVerification;
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields.addAll(
        {'email': model.data.email.toString(), 'code': emailVeriCodeText.value.text});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) async {
        String strData = value;
        Map<String, dynamic> userModel = json.decode(strData);
        BaseModel model = BaseModel.fromJson(userModel);
        if(model.statusCode==200){
          SigninModel signUp = SigninModel.fromJson(userModel);
          var preferences = MySharedPref();
          await preferences.setSignInModel(signUp,SharePreData.key_SaveSignInModel);
          Navigator.pop(context); //pop dialog
          Get.offAll(UserName());
        }
        else if(model.statusCode==101){
          Navigator.pop(context); //pop dialog
          snackBar(context, model.message);
        }
        else{
          Navigator.pop(context); //pop dialog
          snackBar(context,"Resend Code");
        }
      });

    } else {
      Navigator.pop(context); //pop dialog
      snackBar(context, response.reasonPhrase);
    }
  }

  Future<void> callPhoneVerificationApi(BuildContext context) async {
    onLoading(context,"Loading..");
    String url = urlBase + urlPostPhoneVerification;
    var request = http.MultipartRequest('POST', Uri.parse(url));

    var preferences = MySharedPref();
    SigninModel model =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);

    request.fields.addAll({
      'phone_number':model.data.phoneNumber.toString(),
      'otp': phoneVeriCodeText.value.text
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) async {
        String strData = value;
        Map<String, dynamic> userModel = json.decode(strData);
        BaseModel model = BaseModel.fromJson(userModel);

        if(model.statusCode==200){
          SigninModel signUp = SigninModel.fromJson(userModel);

          // snackBar(context, "Code Verifying..........");
          var preferences = MySharedPref();
          await preferences.setSignInModel(signUp,SharePreData.key_SaveSignInModel);

          Navigator.pop(context); //pop dialog
          Get.offAll(UserName());
        }
        else if(model.statusCode==101){
          Navigator.pop(context); //pop dialog
          snackBar(context, model.message);
        }else{
          Navigator.pop(context); //pop dialog
          snackBar(context,"Resend Code");
        }

      });
    } else {
      Navigator.pop(context); //pop dialog
      snackBar(context, response.reasonPhrase);
    }
  }

  Future<void> callResendCodeApi(BuildContext context) async {
    onLoading(context,"Loading..");
    String url = urlBase + urlPostResendCode;
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields.addAll({
      'email': emailText.value.text,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) {
        String strData = value;
        Map<String, dynamic> userModel = json.decode(strData);
        BaseModel model = BaseModel.fromJson(userModel);

        if(model.statusCode==200){
          Navigator.pop(context); //pop dialog
          snackBar(context, "Code sent successfully");
        }else if(model.statusCode==101){
          Navigator.pop(context); //pop dialog
          snackBar(context, model.message);
        }else{
          Navigator.pop(context); //pop dialog
          snackBar(context,"Resend Code");
        }
      });
    } else {
      Navigator.pop(context); //pop dialog
      snackBar(context, response.reasonPhrase);
    }
  }

  Future<void> callResendOtpApi(BuildContext context) async {
    onLoading(context,"Loading..");
    String url = urlBase + urlPostResendOtp;
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields.addAll({
      'phone_number': phoneText.value.text,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) {
        String strData = value;
        Map<String, dynamic> userModel = json.decode(strData);
        BaseModel model = BaseModel.fromJson(userModel);

        if(model.statusCode==200){
          Navigator.pop(context); //pop dialog
          snackBar(context, "Code sent successfully");
        }else if(model.statusCode==101){
          Navigator.pop(context); //pop dialog
          snackBar(context, model.message);
        }else{
          Navigator.pop(context); //pop dialog
          snackBar(context,"Resend Code");
        }

      });
    } else {
      Navigator.pop(context); //pop dialog
      snackBar(context, response.reasonPhrase);
    }
  }

}
