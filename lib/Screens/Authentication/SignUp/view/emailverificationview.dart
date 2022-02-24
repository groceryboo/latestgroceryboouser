import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/controller/signupcontroller.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';
import 'package:groceryboouser/Utils/internet_connection.dart';
import 'package:groceryboouser/Utils/share_predata.dart';

class ConfirmationCode extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<ConfirmationCode> {

  SignupController controller = Get.put(SignupController());
  final loginKey = GlobalKey<FormState>();

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
    header = "Enter the confirmation code we sent to " + controller.emailText.value.text;

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
                                Text(ConfirmationCod,
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
          body: Form(
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
                      Container(
                        height: HeightData.sixty,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: grey_e9ecec),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 6, bottom: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  // child: setTextField(
                                  //   emailTextController,
                                  //   "Enter the confirmation code...",
                                  //   false,
                                  //   TextInputType.number,
                                  //   false,
                                  //   "",
                                  //   TextInputAction.done,
                                  //   () => {
                                  //     // on Chnages
                                  //   },
                                  // ),
                                  child: Theme(
                                      data: new ThemeData(
                                        primaryColor: Colors.green,
                                        primaryColorDark: Colors.red,
                                      ),
                                      child: TextFormField(
                                        controller:
                                            controller.emailVeriCodeText.value,
                                        style: TextStyle(
                                            color: black,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: sf_pro_display_medium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0),
                                        decoration: new InputDecoration(
                                          isDense: true,
                                          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                                          hintText:
                                              "Enter the confirmation code...",
                                          hintStyle: TextStyle(
                                              color: grey_96a6a3,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: sf_pro_display_medium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0),
                                          border: InputBorder.none,
                                        ),
                                        textInputAction: TextInputAction.done,
                                        // keyboardType: KeyboardKey.inputType,
                                        cursorColor: black,
                                        validator: (value) {
                                          if (value != null) {
                                            return null;
                                          } else {
                                            return 'Enter code';
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
                      // ContinueGreenButton(CONTINUE),
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
                                    controller
                                        .callEmailVerificationApi(context);
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
                                  side:
                                      BorderSide(color: skygreen_24d39e, width: 0),
                                ),
                              )),
                        ),
                      ),

                      SizedBox(
                        height: 48,
                      ),
                      // Don’t receive the Confirmation code?
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
                              controller.callResendCodeApi(context);
                            })
                          },
                          child: Text(resendcode,
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
        ),
      )),
    );
  }
}
