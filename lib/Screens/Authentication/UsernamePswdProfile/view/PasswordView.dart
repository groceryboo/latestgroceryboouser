import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/controller/profilecon.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';
import 'package:groceryboouser/Utils/internet_connection.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  ProfileController controller = Get.put(ProfileController());

  RegExp r = RegExp("^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}");

  String pswd;

  // var emailTextController = TextEditingController();

  // TextEditingController fname = TextEditingController();
  bool texterror = false;

  // TextEditingController userNameController = TextEditingController();
  bool userNameValidate = false;

  bool isSelected = false;

  bool checkBorder = false;
  bool checkFillColor = false;
  bool checkTextColor = false;

  bool _isObscure = true;

  bool selectedsecond = false;

  bool checkDigit = false, checkLetter = false, checkCharacters = false;

  @override
  void initState() {
    // fname.text = "";
    super.initState();
  }

  TextEditingController textController = TextEditingController();
  RegExp digitValidator = RegExp(r'^[a-z A-Z]+$');
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
                              Text(createpassword,
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(yourpassword,
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
                        left: 6,
                        right: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: TextField(
                                  obscureText: _isObscure,
                                  controller: controller.passwordText.value,
                                  style: TextStyle(
                                      color: black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: sf_pro_display_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  onChanged: (value) {
                                    setState(() {
                                      RegExp r3 = RegExp(r'.{8,}');
                                      if (r3.hasMatch(value)) {
                                        checkCharacters = true;
                                      } else {
                                        checkCharacters = false;
                                      }
                                      RegExp r1 = RegExp(r'(?=.*?[a-z])');
                                      if (r1.hasMatch(value)) {
                                        checkLetter = true;
                                      } else {
                                        checkLetter = false;
                                      }
                                      RegExp r2 = RegExp(r'(?=.*?[0-9])');
                                      if (r2.hasMatch(value)) {
                                        checkDigit = true;
                                      } else {
                                        checkDigit = false;
                                      }
                                      if (r.hasMatch(value)) {
                                        checkLetter = true;
                                        checkCharacters = true;
                                        checkDigit = true;
                                      }
                                    });
                                  },
                                  decoration: new InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 15),
                                    hintText: "Enter password",
                                    suffixIcon: IconButton(
                                        padding: new EdgeInsets.all(0.0),
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
                                        fontFamily: sf_pro_display_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
                                    border: InputBorder.none,
                                  ),
                                  cursorColor: black,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(15),
                                  ],
                                  textInputAction: TextInputAction.done,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedsecond = !selectedsecond;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
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
                        Text(save_password,
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
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Has at least 8 characters
                      Text(has_at_list_8,
                          style: TextStyle(
                              color: grey_96a6a3,
                              fontWeight: FontWeight.w500,
                              fontFamily: sf_pro_display_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                      checkCharacters == true
                          ? SvgPicture.asset(done, width: 15, height: 15)
                          : SvgPicture.asset(cancel, width: 15, height: 15),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Has one letter
                      Text(has_one_letter,
                          style: TextStyle(
                              color: grey_96a6a3,
                              fontWeight: FontWeight.w500,
                              fontFamily: sf_pro_display_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                      checkLetter == true
                          ? SvgPicture.asset(done, width: 15, height: 15)
                          : SvgPicture.asset(cancel, width: 15, height: 15),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Has one digit
                      Text(has_one_digit,
                          style: TextStyle(
                              color: grey_96a6a3,
                              fontWeight: FontWeight.w500,
                              fontFamily: sf_pro_display_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                      checkDigit == true
                          ? SvgPicture.asset(done, width: 15, height: 15)
                          : SvgPicture.asset(cancel, width: 15, height: 15),
                    ],
                  ),
                  SizedBox(
                    height: 32,
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
                            {

                              FocusScope.of(context).unfocus();
                              if (controller.passwordText.value.text.isEmpty) {
                                snackBar(context, "Enter password");
                                return;
                              }
                              if (checkCharacters == true &&
                                  checkDigit == true &&
                                  checkLetter == true) {
                                checkNet(context).then((value) {
                                  controller.callUsernamePswdApi(context, "2");
                                });
                              } else {
                                snackBar(context, "Enter valid password");
                              }
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
                ],
              ),
            ),
          ],
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
