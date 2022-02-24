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


class ResetPswdView extends StatefulWidget {
  @override
  _ResetPswdViewState createState() => _ResetPswdViewState();
}

class _ResetPswdViewState extends State<ResetPswdView> {

  final loginKey = GlobalKey<FormState>();
  ResetPswdController controller = Get.put(ResetPswdController());

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
                              child: Text(set_new_password,
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
                                                controller.newPswdText.value,
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
                                                  hintText: "Enter New password",
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
                                                    return 'Enter New Password';
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
                                                controller.confirmPswdText.value,
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
                                                  hintText: "Enter Confirm password",
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
                                                    return 'Enter confirm Password';
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
                                CommonElevatedButton(
                                  "Continue",
                                  Colors.white,
                                  skygreen_24d39e,
                                      () {
                                    FocusScope.of(context).unfocus();
                                    if (loginKey.currentState.validate()) {
                                      checkNet(context).then((value) {
                                        print("if");
                                        if(controller.newPswdText.value.text.toString() != controller.confirmPswdText.value.text.toString()){
                                          snackBar(context, "Password not matched");
                                          return;
                                        }
                                        controller.resetPswdAPI(context);
                                      });
                                    } else {
                                      print("else");
                                    }

                                  },
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
        ));

  }

}
