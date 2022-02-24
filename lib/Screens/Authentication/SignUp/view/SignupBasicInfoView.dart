import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/controller/UpdatedSignupController.dart';
import 'package:groceryboouser/Screens/Authentication/SocialMediaLogin/controller/googlesignincon.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';
import 'package:groceryboouser/Utils/internet_connection.dart';

class SignupBasicInfoView extends StatefulWidget {
  const SignupBasicInfoView({Key key}) : super(key: key);

  @override
  _SignupBasicInfoViewState createState() => _SignupBasicInfoViewState();
}

class _SignupBasicInfoViewState extends State<SignupBasicInfoView> {
  UpdatedSignupController controller = Get.put(UpdatedSignupController());
  final SocialMediaSigninController googlesignInCon = Get.put(SocialMediaSigninController());

  final signupKey = GlobalKey<FormState>();

  FacebookAuth _facebookAuth;
  Map<String, dynamic> _userData;

  static const _kBasePadding = 17.0;
  static const kExpandedHeight = 150.0;

  final ValueNotifier<double> _titlePaddingNotifier =
  ValueNotifier(_kBasePadding);

  final _scrollController = ScrollController();

  double get _horizontalTitlePadding {
    const kCollapsedPadding = 50.0;

    if (_scrollController.hasClients) {
      return min(
          _kBasePadding + kCollapsedPadding,
          _kBasePadding +
              (kCollapsedPadding * _scrollController.offset) /
                  (kExpandedHeight - kToolbarHeight));
    }

    return _kBasePadding;
  }

  @override
  Widget build(BuildContext context) {

    _scrollController.addListener(() {
      _titlePaddingNotifier.value = _horizontalTitlePadding;
    });

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: blue_3551ff, // navigation bar color
      statusBarColor: blue_3551ff, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.light, //navigation bar icons' color
    ));
    return SafeArea(
      child:
      Scaffold(
        backgroundColor: blue_3551ff,
        body: NestedScrollView(
          controller: _scrollController,
          physics: ScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: blue_3551ff,
                  toolbarHeight: 80,
                  title: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child:  SvgPicture.asset(
                      BackArrow,
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                  ),
                  forceElevated: innerBoxIsScrolled,
                  expandedHeight: kExpandedHeight,
                  floating: false,
                  pinned: true,
                  stretch: false,
                  shadowColor: grey_e9ecec.withOpacity(0.3),
                  flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      centerTitle: false,
                      titlePadding:
                      EdgeInsets.symmetric(vertical: 26, horizontal: 0),
                      title: ValueListenableBuilder(
                        valueListenable: _titlePaddingNotifier,
                        builder: (context, value, child) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: double.parse(value.toString())),
                            child:
                            // Sign up

                            setMediumSFProText("Sign Up", HeightData.eighteen, Colors.white,
                                FontWeight.w700, FontStyle.normal),
                          );
                        },
                      ),
                      background: Container(color: blue_3551ff))),
            ];
          },
          body: Obx(
                () =>  Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Form(
                    key: signupKey,
                    child: ListView(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24,right: 24,bottom: 24,top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                height: HeightData.sixty_two,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        8)),
                                    color: edt_blue_213deb),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 14,
                                    right: 14,
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
                                                controller: controller.firstNameText
                                                    .value,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: sf_pro_display_semibold,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16.0),
                                                decoration: new InputDecoration(
                                                  isDense: true,
                                                  // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                                                  hintText: "First Name",
                                                  hintStyle: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.7),
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: sf_pro_display_semibold,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 16.0),
                                                  border: InputBorder.none,
                                                ),
                                                textInputAction: TextInputAction.next,
                                                keyboardType:  TextInputType.text,
                                                cursorColor: Colors.white,
                                                validator: (value) {
                                                  if (value
                                                      .toString()
                                                      .isNotEmpty) {
                                                    return null;
                                                  } else {
                                                    return "Enter First Name";
                                                  }
                                                },
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                height: HeightData.sixty_two,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        8)),
                                    color: edt_blue_213deb),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 14,
                                    right: 14,
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
                                                controller: controller.lastNameText
                                                    .value,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: sf_pro_display_semibold,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16.0),
                                                decoration: new InputDecoration(
                                                  isDense: true,
                                                  // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                                                  hintText: "Last Name",
                                                  hintStyle: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.7),
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: sf_pro_display_semibold,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 16.0),
                                                  border: InputBorder.none,
                                                ),
                                                textInputAction: TextInputAction.next,
                                                keyboardType:  TextInputType.text,
                                                cursorColor: Colors.white,
                                                validator: (value) {
                                                  if (value
                                                      .toString()
                                                      .isNotEmpty) {
                                                    return null;
                                                  } else {
                                                    return "Enter Last Name";
                                                  }
                                                },
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                height: HeightData.sixty_two,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        8)),
                                    color: edt_blue_213deb),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 14,
                                    right: 14,
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
                                                controller: controller.emailText
                                                    .value,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: sf_pro_display_semibold,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16.0),
                                                decoration: new InputDecoration(
                                                  isDense: true,
                                                  // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                                                  hintText: "Email",
                                                  hintStyle: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.7),
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: sf_pro_display_semibold,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 16.0),
                                                  border: InputBorder.none,
                                                ),

                                                textInputAction: TextInputAction.done,

                                                keyboardType: TextInputType.emailAddress,
                                                cursorColor: black,
                                                validator: (value) {
                                                  if (GetUtils.isEmail(value)) {
                                                    return null;
                                                  } else {
                                                    return "Enter valid email Id";
                                                  }
                                                },
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 32,
                              ),

                              SizedBox(
                                height: HeightData.sixty_two,
                                child: CommonElevatedButton(
                                  "CONTINUE",
                                  blue_3551ff,
                                  Colors.white,
                                      () {
                                    FocusScope.of(context).unfocus();
                                    if (signupKey.currentState.validate()) {
                                      checkNet(context).then((value) {
                                        print("if");
                                        controller.callSignupFirstApi(context);
                                      });
                                    } else {
                                      print("else");
                                    }
                                  },
                                ),
                              ),

                              SizedBox(
                                height: 18,
                              ),
                              // We will send a text with verification code. Message and data rates may apply. By continuing, you agr
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        style: const TextStyle(
                                            color: const Color(0xb3ffffff),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: sf_pro_display_regular,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 11.0,
                                            height: 1.2),
                                        text: we_will),
                                    TextSpan(
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: sf_pro_display_regular,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 11.0,
                                            height: 1.2),
                                        text: terms),
                                    TextSpan(
                                        style: const TextStyle(
                                            color: const Color(0xb3ffffff),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: sf_pro_display_regular,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 11.0,
                                            height: 1.2),
                                        text: and),
                                    TextSpan(
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: sf_pro_display_regular,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 11.0,
                                            height: 1.2),
                                        text: privacy_policy),
                                    TextSpan(
                                        style: const TextStyle(
                                            color: const Color(0xb3ffffff),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: sf_pro_display_regular,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 11.0,
                                            height: 1.2),
                                        text: ".")
                                  ])),
                              SizedBox(
                                height: 26,
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
                                    width: 10,
                                  ),
                                  // OR
                                  Text(or,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: sf_pro_display_bold,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 11.0),
                                      textAlign: TextAlign.center),
                                  SizedBox(
                                    width: 10,
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
                                height: 26,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  _facebookAuth = FacebookAuth.instance;
                                  final LoginResult result = await _facebookAuth
                                      .login();

                                  bool _isLogged = result.status ==
                                      LoginStatus.success;
                                  if (_isLogged) {
                                    _userData = await _facebookAuth.getUserData();
                                    print("_userData $_userData");
                                    // print("UserData" +  _userData.accessToken.toString());
                                    if (_userData != null) {
                                      googlesignInCon.facebookData = _userData;

                                      print("Facebook "+ _userData["id"].toString());
                                      print("Facebook "+ _userData["picture"]["data"]["url"].toString());
                                      print("Facebook "+ _userData["name"].toString());
                                      print("Facebook "+ _userData["email"].toString());

                                      googlesignInCon.callSocialLoginAPI(context, "facebook");
                                    }
                                  }

                                },
                                child: Container(
                                  height: HeightData.sixty_two,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
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
                                        SizedBox(
                                          width: 5,
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
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                height: HeightData.sixty_two,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1, //
                                      color: Colors
                                          .white //                 <--- border width here
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () =>
                                  {
                                    if (googlesignInCon.googleAccount.value == null)
                                      {
                                        googlesignInCon.googleLogin(context),
                                      }
                                    else
                                      {
                                        googlesignInCon.callSocialLoginAPI(
                                            context, "google"),
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
                                          width: 10,
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
                                height: 40,
                              ),
                              // footer text
                              Center(
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          style: TextStyle(
                                              color: Colors.white.withOpacity(0.7),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: sf_pro_display_regular,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0),
                                          text: already_account),
                                      TextSpan(
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: sf_pro_display_bold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0),
                                          text: signin)
                                    ])),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}