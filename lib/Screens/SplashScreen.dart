import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Authentication/SignIn/view/signinview.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/view/phoneverificationview.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/view/AddProfilePhotoView.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/view/PasswordView.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/view/UserNameView.dart';
import 'package:groceryboouser/Screens/Dashboard/view/BottomNavigation.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashUiState();
}

class _SplashUiState extends State<SplashScreen> {
  var preferences = MySharedPref();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirectOnPendingState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    // final size = MediaQuery.of(context).size;
    return FittedBox(
      child: Image.asset(splash),
      fit: BoxFit.fill,
    );

  }

  redirectOnPendingState() async {
    SigninModel model =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);

    if(model==null){
      Get.to(Welcome());
    }else{
      Future.delayed(Duration(seconds: 2), () async {
        if (model.data.id.toString().isNotEmpty) {
          if (model.data.token.toString().isEmpty) {
            if (model.data.phoneNumber.toString().isNotEmpty) {
              Get.to(OtpVerification());
            }else{
              Get.to(SignIn());
            }
            // if (model.data.email.toString().isNotEmpty) {
            //   Get.to(ConfirmationCode());
            // }
            // else if (model.data.phoneNumber.toString().isNotEmpty) {
            //   Get.to(OtpVerification());
            // }

          }
          else {
            if (model.data.userName.toString().isEmpty) {
              Get.to(UserName());
            } else if (model.data.password.toString().isEmpty) {
              Get.to(Password());
            } else if (model.data.image.toString().isEmpty) {
              Get.to(AddProfilePhoto());
            } else {
              Get.to(BottomNavigation());
            }
          }

        }
        else{
          Get.to(SignIn());
        }
      });

    }
  }

}
