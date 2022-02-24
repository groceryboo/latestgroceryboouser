import 'dart:math';

import 'package:country_code_picker/country_code_picker.dart';
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
import 'package:groceryboouser/Utils/internet_connection.dart';

class ForgotPswdView extends StatefulWidget {
  @override
  _ForgotPswdViewState createState() => _ForgotPswdViewState();
}

class _ForgotPswdViewState extends State<ForgotPswdView> {
  final checkKey = GlobalKey<FormState>();
  ResetPswdController controller = Get.put(ResetPswdController());

  bool texterror = false;
  bool userNameValidate = false;
  bool isSelected = false;
  bool checkBorder = false;
  bool checkFillColor = false;
  bool checkTextColor = false;
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
                          padding: EdgeInsets.symmetric(
                              horizontal: double.parse(value.toString())),
                          child: Text(forgot_pswd,
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
          () => Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Form(
              key: checkKey,
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: grey_e9ecec),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 6,
                            right: 6,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CountryCodePicker(
                                onChanged: (e) => print(e.toLongString()),
                                initialSelection: 'IND',
                                showCountryOnly: true,
                                padding: EdgeInsets.zero,
                                showFlagMain: true,
                                flagWidth: 25,
                                textStyle: TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontFamily: sf_pro_display_bold),
                                showOnlyCountryWhenClosed: false,
                                favorite: ['+91', 'IND'],
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Container(
                                  width: 1,
                                  height: 27,
                                  decoration:
                                      BoxDecoration(color: Color(0x4d000000))),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  // child: setTextField(
                                  //   mobileNumberTextController,
                                  //   "Enter your mobile number",
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
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller:
                                            controller.phoneNumText.value,
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
                                              "Enter your phone number...",
                                          hintStyle: TextStyle(
                                              color: grey_96a6a3,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: sf_pro_display_medium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0),
                                          border: InputBorder.none,
                                        ),
                                        // textInputAction: textInputAction,
                                        // keyboardType: inputType,
                                        cursorColor: black,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(10),
                                        ],
                                        validator: (String argsa) {
                                          if (GetUtils.isPhoneNumber(argsa)) {
                                            return null;
                                          } else {
                                            return "Phone no is not valid";
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
                      CommonElevatedButton(
                        "Continue",
                        Colors.white,
                        skygreen_24d39e,
                        () {
                          FocusScope.of(context).unfocus();
                          if (checkKey.currentState.validate()) {
                            checkNet(context).then((value) {
                              controller.forgotPswdAPI(context);
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
