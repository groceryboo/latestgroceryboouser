import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Authentication/SignIn/view/signinview.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/view/SignupBasicInfoView.dart';
import 'package:groceryboouser/Screens/BottomNavigation.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:video_player/video_player.dart';
import 'Screens/Authentication/SignUp/view/phoneverificationview.dart';
import 'Screens/Authentication/UsernamePswdProfile/view/AddProfilePhotoView.dart';
import 'Screens/Authentication/UsernamePswdProfile/view/PasswordView.dart';
import 'Screens/Authentication/UsernamePswdProfile/view/UserNameView.dart';
import 'Styles/my_colors.dart';
import 'Styles/my_height.dart';
import 'Styles/my_strings.dart';
import 'Utilities/Constant.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    _videoController = VideoPlayerController.asset("assets/videos/welcome.webm")
      ..initialize().then((_) {
        _videoController.play();
        _videoController.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: black, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));

    Widget backVideo() {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: width,
                height: height,
                child: VideoPlayer(_videoController),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => {
                        setState(() {
                          _videoController.pause();
                        }),
                        Get.off(SignupBasicInfoView())
                      },
                      child: Container(
                        width: double.infinity,
                        height: HeightData.sixty,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 38,
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(getstarted,
                                    style: TextStyle(
                                      color: parrot_green_69d271,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: sf_pro_display_semibold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0,
                                    ),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                forward,
                                width: 18,
                                height: 18,
                                alignment: Alignment.center,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _videoController.pause();
                        });
                        Get.off(() => SignIn());
                      },
                      child: Container(
                        width: double.infinity,
                        height: HeightData.sixty,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text(login,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: sf_pro_display_semibold,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment(0, 0),
        //     end: Alignment(0, 0),
        //     colors: [Color(0x00000000), Color(0xff121212)],
        //   ),
        // ),
        child: Column(
          children: [
            backVideo(),
          ],
        ),
      ),
    );
  }

// redirectOnPendingState() async {
//   setState(() {
//     _videoController.pause();
//   });
//   var preferences = MySharedPref();
//
//   SigninModel model =
//       await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
//
//   if (model != null) {
//     if (model.data.id.toString().isNotEmpty) {
//       if (model.data.token.toString().isEmpty) {
//         if (model.data.phoneNumber.toString().isNotEmpty) {
//           Get.to(OtpVerification());
//         }else{
//           Get.to(SignIn());
//         }
//         // if (model.data.email.toString().isNotEmpty) {
//         //   Get.to(ConfirmationCode());
//         // }
//         // else if (model.data.phoneNumber.toString().isNotEmpty) {
//         //   Get.to(OtpVerification());
//         // }
//
//       }
//       else {
//         if (model.data.socialType.toString().isNotEmpty) {
//           Get.to(BottomNavigation());
//         } else {
//           if (model.data.userName.toString().isEmpty) {
//             Get.to(UserName());
//           } else if (model.data.password.toString().isEmpty) {
//             Get.to(Password());
//           } else if (model.data.image.toString().isEmpty) {
//             Get.to(AddProfilePhoto());
//           } else {
//             Get.to(BottomNavigation());
//           }
//         }
//       }
//     }else{
//       Get.to(SignIn());
//     }
//   } else {
//     Get.to(SignIn());
//   }
// }

}
