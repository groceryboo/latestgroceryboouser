import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Screens/Authentication/ForgotPassword/controller/ResetPasswordController.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';
import 'package:groceryboouser/Utils/internet_connection.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerify extends StatefulWidget {
  @override
  _OtpVerifyState createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  ResetPswdController controller = Get.put(ResetPswdController());

  String currentText = "";
  String header;

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
    header = "Enter the confirmation code we sent to " +
        controller.phoneNumText.value.text;

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

    return Obx(
          () => SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            // appBar: toolbar(context, ""),
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
                                Text(enterotp,
                                    style: TextStyle(
                                      color: black,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: sf_pro_display_bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: HeightData.sixteen,
                                    ),
                                    textAlign: TextAlign.left),
                              );
                            },
                          ),
                          background: Container(color: Colors.white))),
                ];
              },
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Enter the confirmation code we sent to dm2group@gmail.com
                        Text(header,
                            style: TextStyle(
                                color: grey_aaaaaa,
                                fontWeight: FontWeight.w500,
                                fontFamily: sf_pro_display_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.left),

                        SizedBox(
                          height: 24,
                        ),

                        Center(
                          child: SizedBox(
                            width: 300,
                            child: Theme(
                              data: ThemeData(
                                primaryColor: black,
                                primaryColorDark: black,
                                focusColor: black,
                                textSelectionTheme: TextSelectionThemeData(
                                  cursorColor: black, //thereby
                                ),
                              ),

                              // child: PinEntryTextField(
                              //   fields: 6,
                              //   onSubmit: (text) {},
                              // ),

                              child: PinCodeTextField(
                                appContext: context,
                                pastedTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                length: 6,
                                obscureText: true,
                                obscuringCharacter: '*',
                                obscuringWidget: FlutterLogo(
                                  size: 24,
                                ),
                                blinkWhenObscuring: true,
                                animationType: AnimationType.fade,
                                validator: (v) {
                                  if (v.length < 3) {
                                    return "Enter correct OTP";
                                  } else {
                                    return null;
                                  }
                                },
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 50,
                                    fieldWidth: 40,
                                    activeFillColor: Colors.white,
                                    inactiveColor: Colors.white,
                                    inactiveFillColor: Colors.white,
                                    errorBorderColor: Colors.white,
                                    activeColor: Colors.white,
                                    selectedColor: Colors.white,
                                    selectedFillColor: Colors.white),
                                cursorColor: Colors.black,
                                animationDuration: Duration(milliseconds: 300),
                                enableActiveFill: true,
                                // errorAnimationController: errorController,
                                controller: controller.otpCodeText.value,
                                keyboardType: TextInputType.number,
                                boxShadows: [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.black12,
                                    blurRadius: 10,
                                  )
                                ],
                                onCompleted: (v) {
                                  print("Completed");
                                },
                                // onTap: () {
                                //   print("Pressed");
                                // },
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    currentText = value;
                                  });
                                },
                                beforeTextPaste: (text) {
                                  print("Allowing to paste $text");
                                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                  return true;
                                },
                              ),

                              // child: SizedBox(),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 32,
                        ),
                        CommonElevatedButton(
                          "Continue",
                          Colors.white,
                          skygreen_24d39e,
                              () {
                                FocusScope.of(context).unfocus();
                                if (currentText.length < 6) {
                                  snackBar(context, "Otp Invalid");
                                  return;
                                }
                                checkNet(context).then((value) {
                                  controller.otpVerifyAPI(context);

                                });
                          },
                        ),

                        SizedBox(
                          height: 48,
                        ),
                        // Don???t receive the Confirmation code?
                        Center(
                          child: Text(dontreceive,
                              style: TextStyle(
                                  color: grey_aaaaaa,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: sf_pro_display_regular,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.center),
                        ),

                        // Resend Code
                        Center(
                          child: InkWell(
                            onTap: () => {
                              FocusScope.of(context).unfocus(),
                              checkNet(context).then((value) {
                                controller.resendOtpAPI(context);

                              })
                            },
                            child: Text(resendotp,
                                style: TextStyle(
                                    color: skygreen_24d39e,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: sf_pro_display_bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.center),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
