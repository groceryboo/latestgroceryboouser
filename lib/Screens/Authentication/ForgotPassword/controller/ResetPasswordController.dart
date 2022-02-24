import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Screens/Authentication/ForgotPassword/model/ForgotPasswordModel.dart';
import 'package:groceryboouser/Screens/Authentication/ForgotPassword/view/OtpVerifyView.dart';
import 'package:groceryboouser/Screens/Authentication/ForgotPassword/view/ResetPswdView.dart';
import 'package:groceryboouser/Screens/Dashboard/view/BottomNavigation.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:http/http.dart' as http;

//subbranch updated
class ResetPswdController extends GetxController {
  Rx<TextEditingController> phoneNumText = TextEditingController().obs;
  Rx<TextEditingController> otpCodeText = TextEditingController().obs;
  Rx<TextEditingController> newPswdText = TextEditingController().obs;
  Rx<TextEditingController> confirmPswdText = TextEditingController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init State");
  }

  forgotPswdAPI(BuildContext context) async {
    onLoading(context, "Loading..");
    String url = urlBase + urlForgotPassword;

    dynamic body = {
      'phone_number': phoneNumText.value.text,
    };

    final apiReq = Request();
    await apiReq.postAPIwithoutBearer(url, body).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("Forgot Password MSG", model.message.toString());

          // if(model.statusCode ==500){
          //   final tokenUpdate = TokenUpdateRequest();
          //   await tokenUpdate.updateToken();
          //
          //   forgotPswdAPI(context);
          // }
          // else
          if (model.statusCode == 200) {
            ForgotPasswordModel passwordModel =
                ForgotPasswordModel.fromJson(userModel);
            snackBar(context, passwordModel.message);
            printData("Forgot Password status", model.message.toString());
            Navigator.pop(context); //pop dialog
            Get.to(OtpVerify());
          } else {
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

  otpVerifyAPI(BuildContext context) async {
    onLoading(context, "Loading..");
    String url = urlBase + urlVerifiedOtp;

    dynamic body = {
      'phone_number': phoneNumText.value.text,
      'otp': otpCodeText.value.text,
    };

    final apiReq = Request();
    await apiReq.postAPIwithoutBearer(url, body).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("OTP verification MSG", model.message.toString());

          // if(model.statusCode ==500){
          //   final tokenUpdate = TokenUpdateRequest();
          //   await tokenUpdate.updateToken();
          //
          //   forgotPswdAPI(context);
          // }
          // else

          if (model.statusCode == 200) {
            ForgotPasswordModel passwordModel =
                ForgotPasswordModel.fromJson(userModel);
            snackBar(context, passwordModel.message);
            printData("OTP verification", model.message.toString());
            Navigator.pop(context); //pop dialog

            Get.to(ResetPswdView());

          } else {
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

  resendOtpAPI(BuildContext context) async {
    onLoading(context, "Loading..");
    String url = urlBase + urlResendOtp;

    dynamic body = {
      'phone_number': phoneNumText.value.text,
    };

    final apiReq = Request();
    await apiReq.postAPIwithoutBearer(url, body).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("Password MSG", model.message.toString());

          // if(model.statusCode ==500){
          //   final tokenUpdate = TokenUpdateRequest();
          //   await tokenUpdate.updateToken();
          //
          //   forgotPswdAPI(context);
          // }
          // else
          if (model.statusCode == 200) {
            ForgotPasswordModel passwordModel =
                ForgotPasswordModel.fromJson(userModel);
            snackBar(context, passwordModel.message);
            printData("Password Message", model.message.toString());

            Navigator.pop(context); //pop dialog
          } else {
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

  resetPswdAPI(BuildContext context) async {
    onLoading(context, "Loading..");
    String url = urlBase + urlResetPassword;

    dynamic body = {
      'phone_number': phoneNumText.value.text,
      'password': newPswdText.value.text,
    };

    final apiReq = Request();
    await apiReq.postAPIwithoutBearer(url, body).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("OTP verification MSG", model.message.toString());

          // if(model.statusCode ==500){
          //   final tokenUpdate = TokenUpdateRequest();
          //   await tokenUpdate.updateToken();
          //
          //   forgotPswdAPI(context);
          // }
          // else
          if (model.statusCode == 200) {
            ForgotPasswordModel passwordModel =
                ForgotPasswordModel.fromJson(userModel);
            snackBar(context, passwordModel.message);
            printData("OTP verification", model.message.toString());

            Navigator.pop(context); //pop dialog
            Get.off(BottomNavigation());

          } else {
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

}
