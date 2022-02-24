import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Screens/Authentication/SignIn/view/signinview.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/controller/signupcontroller.dart';
import 'package:groceryboouser/Screens/Authentication/SocialMediaLogin/controller/googlesignincon.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';
import 'package:groceryboouser/Utils/internet_connection.dart';
import 'package:groceryboouser/Utils/share_predata.dart';

class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  SignupController controller = Get.put(SignupController());
  final SocialMediaSigninController googlesignInCon =
  Get.put(SocialMediaSigninController());

  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));
    return Obx(
      () => SafeArea(
          child: ScreenUtilInit(
            designSize: Size(360, 690),
            builder: () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        // Rectangle 12
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Form(
                key: loginKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: HeightData.sixty,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: grey_e9ecec),
                          child: Padding(
                            padding:  EdgeInsets.only(
                              left: 12.w,
                              right: 12.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Theme(
                                        data: new ThemeData(
                                          primaryColor: Colors.green,
                                          primaryColorDark: Colors.red,
                                        ),
                                        child: TextFormField(
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          controller: controller.emailText.value,
                                          style: TextStyle(
                                              color: black,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: sf_pro_display_medium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0),
                                          decoration: new InputDecoration(
                                            isDense: true,
                                            // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                                            hintText: "Enter your email address",
                                            hintStyle: TextStyle(
                                                color: grey_96a6a3,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: sf_pro_display_medium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0),
                                            border: InputBorder.none,
                                          ),
                                          // textInputAction: TextInputType.emailAddress,
                                          // keyboardType: TextInputAction.done,
                                          cursorColor: black,
                                          validator: (value) {
                                            if (GetUtils.isEmail(value)) {
                                              return null;
                                            } else {
                                              return "Enter valid email Id";
                                            }
                                          },
                                        )),

                                    // child: setTextField(
                                    //   controller.emailText.value,
                                    //   "Enter your email address",
                                    //   false,
                                    //   TextInputType.emailAddress,
                                    //   false,
                                    //   "",
                                    //   TextInputAction.done,
                                    //   (value) => {
                                    //     // on Chnages
                                    //
                                    //   },
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Color(0x17747796).withOpacity(0.07),
                              spreadRadius: 10,
                              blurRadius: 10,
                              offset: Offset(0, 20), // changes position of shadow
                            ),
                          ]),
                          child: SizedBox(
                            width: double.infinity,
                            height: HeightData.sixty,
                            child: ElevatedButton(
                                child: //
                                    setBoldSfProDisplayTextAlign(
                                        CONTINUE,
                                        14,
                                        Colors.white,
                                        FontWeight.w500,
                                        FontStyle.normal,
                                        TextAlign.center), // Button
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  if (loginKey.currentState.validate()) {
                                    checkNet(context).then((value) {
                                      print("if");
                                      controller.callSignupApi(
                                          context, SharePreData.key_email);
                                    });
                                  } else {
                                    print("else");
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: skygreen_24d39e,
                                  onPrimary: Colors.white,
                                  elevation: 0,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 21),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(color: skygreen_24d39e, width: 0),
                                  ),
                                )),
                          ),
                        ),

                        SizedBox(
                          height: 35.h,
                        ),
                        // We will send a text with verification code. Message and data rates may apply. By continuing, you agr
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              style: const TextStyle(
                                  color: const Color(0xff96a6a3),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: sf_pro_display_regular,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0,
                                  height: 1.2),
                              text: we_will),
                          TextSpan(
                              style: const TextStyle(
                                  color: const Color(0xff24d39e),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: sf_pro_display_regular,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0,
                                  height: 1.2),
                              text: terms),
                          TextSpan(
                              style: const TextStyle(
                                  color: const Color(0xff96a6a3),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: sf_pro_display_regular,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0,
                                  height: 1.2),
                              text: and),
                          TextSpan(
                              style: const TextStyle(
                                  color: const Color(0xff24d39e),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: sf_pro_display_regular,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0,
                                  height: 1.2),
                              text: privacy_policy),
                          TextSpan(
                              style: const TextStyle(
                                  color: const Color(0xff96a6a3),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: sf_pro_display_regular,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0,
                                  height: 1.2),
                              text: ".")
                        ])),
                        SizedBox(
                          height: 35.h,
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: new EdgeInsetsDirectional.only(
                                    start: 1.0, end: 1.0),
                                height: 1,
                                color: Color(0xffe9ecec),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            // OR
                            Text(or,
                                style: TextStyle(
                                    color: const Color(0xff273433),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: sf_pro_display_bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 11.0),
                                textAlign: TextAlign.center),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Container(
                                margin: new EdgeInsetsDirectional.only(
                                    start: 1.0, end: 1.0),
                                height: 1,
                                color: Color(0xffe9ecec),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),

                        Container(
                          height: HeightData.sixty,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 1, //
                                color:
                                    grey_e9ecec //                 <--- border width here
                                ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  fb_logo,
                                  width: 24,
                                  height: 24,
                                ),
                                // Continue with Facebook
                                Text(continue_with_facebook,
                                    style: TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: sf_pro_display_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
                                    textAlign: TextAlign.center)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          height: HeightData.sixty,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 1, //
                                color:
                                    grey_e9ecec //                 <--- border width here
                                ),
                          ),
                          child: InkWell(
                            onTap:()=>{
                              if (googlesignInCon.googleAccount.value == null)
                                {
                                  googlesignInCon.googleLogin(context),
                                }
                              else
                                {
                                  googlesignInCon.callSocialLoginAPI(context,"google"),
                                }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    google_logo,
                                    width: 20,
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  // Continue with google sigin
                                  Text(continue_with_google,
                                      style: TextStyle(
                                          color: black,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: sf_pro_display_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.0),
                                      textAlign: TextAlign.center)
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        // footer text
                        InkWell(
                          onTap: () =>
                              checkNet(context).then((value) {
                                Get.to(SignIn());
                              })
                          ,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(
                                    color: Color(0xffaaaaaa),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: sf_pro_display_regular,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                text: already_account),
                            TextSpan(
                                style: TextStyle(
                                    color: skygreen_24d39e,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: sf_pro_display_bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                text: signin)
                          ])),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

          ),
        ),
      ),
          )),
    );
  }
}
