import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Screens/Authentication/ForgotPassword/view/ForgotPswdView.dart';
import 'package:groceryboouser/Screens/Authentication/SignIn/controller/signincon.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/view/SignupBasicInfoView.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utils/internet_connection.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final loginKey = GlobalKey<FormState>();
  SigninController controller = Get.put(SigninController());

  bool texterror = false;
  bool userNameValidate = false;
  bool isSelected = false;
  bool checkBorder = false;
  bool checkFillColor = false;
  bool checkTextColor = false;
  bool _isObscure = true;
  bool selectedsecond = false;

  bool isAName = true;

  static const _kBasePadding = 17.0;
  static const kExpandedHeight = 150.0;

  final ValueNotifier<double> _titlePaddingNotifier =
      ValueNotifier(_kBasePadding);

  final _scrollController = ScrollController();

  double get _horizontalTitlePadding {
    const kCollapsedPadding = 80.0;

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
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: NestedScrollView(
        controller: _scrollController,
        physics: ScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                toolbarHeight: 80,
                title: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: BackLayout(),
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
                              Text(signin,
                                  style: TextStyle(
                                      color: black,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: sf_pro_display_bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: HeightData.sixteen),
                                  textAlign: TextAlign.left),
                        );
                      },
                    ),
                    background: Container(color: Colors.white))),
          ];
        },
        body: Obx(
          () => Column(
            children: [
              Expanded(
                flex: 1,
                child: Form(
                  key: loginKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24, right: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: HeightData.sixty,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: grey_e9ecec),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 0,
                                  right: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller:
                                                controller.inputText.value,
                                            style: TextStyle(
                                                color: black,
                                                fontWeight: FontWeight.w500,
                                                fontFamily:
                                                    sf_pro_display_medium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0),
                                            decoration: new InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 0,
                                                      vertical: 15),
                                              hintText:
                                                  "Enter Username Or Email Address",
                                              hintStyle: TextStyle(
                                                  color: grey_96a6a3,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      sf_pro_display_medium,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.0),
                                              border: InputBorder.none,
                                            ),
                                            cursorColor: black,
                                            textInputAction:
                                                TextInputAction.done,
                                            validator: (value) {
                                              if (value != null) {
                                                return null;
                                              } else {
                                                return 'Enter Username or email Id';
                                              }
                                            },
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: HeightData.sixty,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: grey_e9ecec),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 0,
                                  right: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller:
                                                controller.pswdText.value,
                                            obscureText: _isObscure,
                                            style: TextStyle(
                                                color: black,
                                                fontWeight: FontWeight.w500,
                                                fontFamily:
                                                    sf_pro_display_medium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0),
                                            decoration: new InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 0,
                                                      vertical: 15),
                                              hintText: "Enter password",
                                              suffixIcon: IconButton(
                                                  padding:
                                                      new EdgeInsets.all(0.0),
                                                  icon: Icon(
                                                    _isObscure
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color: grey_96a6a3,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _isObscure = !_isObscure;
                                                    });
                                                  }),
                                              hintStyle: TextStyle(
                                                  color: grey_96a6a3,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      sf_pro_display_medium,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.0),
                                              border: InputBorder.none,
                                            ),
                                            cursorColor: black,
                                            textInputAction:
                                                TextInputAction.done,
                                            validator: (value) {
                                              if (value != null) {
                                                return null;
                                              } else {
                                                return 'Enter Password';
                                              }
                                            },
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedsecond = !selectedsecond;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3)),
                                            border: Border.all(
                                                color: selectedsecond
                                                    ? Color(0xffdbdbdb)
                                                    : skygreen_24d39e,
                                                width: 1),
                                            color: selectedsecond
                                                ? Color(0xffffffff)
                                                : skygreen_24d39e),
                                        child: selectedsecond
                                            ? Icon(
                                                Icons.check,
                                                size: 18.0,
                                                color: Colors.white,
                                              )
                                            : Icon(
                                                Icons.check,
                                                size: 18.0,
                                                color: Colors.white,
                                              ),
                                      ),
                                      SizedBox(
                                        width: 11.7,
                                      ),
                                      // Save password
                                      Text("Remember password",
                                          style: TextStyle(
                                              color: const Color(0xff273433),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: sf_pro_display_medium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0),
                                          textAlign: TextAlign.left)
                                    ],
                                  ),
                                ),
                                // Forgot password
                                InkWell(
                                  onTap: ()=> {
                                    Get.to(ForgotPswdView()),
                                  },
                                  child: Text("Forgot password?",
                                      style: TextStyle(
                                          color: Color(0xff273433),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: sf_pro_display_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.0),
                                      textAlign: TextAlign.right),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            CommonElevatedButton("CONTINUE", Colors.white, skygreen_24d39e, () {
                              FocusScope.of(context).unfocus();
                              if (loginKey.currentState.validate()) {
                                checkNet(context).then((value) {
                                  print("if");
                                  controller.callSigninApi(context);
                                });
                              } else {
                                print("else");
                              }

                            }),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // footer text
              Text(dont_account,
                  style: TextStyle(
                      color: Color(0xff77767e),
                      fontWeight: FontWeight.w400,
                      fontFamily: sf_pro_display_regular,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.center),

              // footer text
              InkWell(
                onTap: () => Get.to(SignupBasicInfoView()),
                child: Text(create_account,
                    style: TextStyle(
                        color: skygreen_24d39e,
                        fontWeight: FontWeight.w700,
                        fontFamily: sf_pro_display_bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    ));
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void setValidator(valid) {
    setState(() {
      isAName = valid;
    });
  }

}
