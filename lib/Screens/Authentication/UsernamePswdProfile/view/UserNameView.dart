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
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/internet_connection.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';

class UserName extends StatefulWidget {
  @override
  _UserNameState createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  ProfileController controller = Get.put(ProfileController());

  bool texterror = false;
  bool userNameValidate = false;
  bool isSelected = false;

  bool checkBorder = false;
  bool checkFillColor = false;
  bool checkTextColor = false;

  @override
  void initState() {
    controller.userNameText.value.text = "";
    super.initState();
  }
  // TextEditingController textController = TextEditingController();
  RegExp digitValidator = RegExp(r'^[a-z A-Z]+$');
  bool isAName = true;

  static const _kBasePadding = 17.0;
  static const kExpandedHeight = 150.0;

  final ValueNotifier<double> _titlePaddingNotifier = ValueNotifier(_kBasePadding);

  final _scrollController = ScrollController();

  double get _horizontalTitlePadding {
    const kCollapsedPadding = 80.0;

    if (_scrollController.hasClients) {
      return min(_kBasePadding + kCollapsedPadding,
          _kBasePadding + (kCollapsedPadding * _scrollController.offset)/(kExpandedHeight - kToolbarHeight));
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

    return Obx(
      ()=> SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        // appBar: toolbar(context, ""),
        body: NestedScrollView(
          controller: _scrollController,
          physics:  ScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  toolbarHeight: 80,
                  title: Padding(
                    padding:  EdgeInsets.only(left: 10),
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
                      titlePadding: EdgeInsets.symmetric(vertical: 26, horizontal: 0),
                      title: ValueListenableBuilder(
                        valueListenable: _titlePaddingNotifier,
                        builder: (context, value, child) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: double.parse(value.toString())),
                            child:
                            // Sign up
                            Text(
                                createuername,
                                style:  TextStyle(
                                  color:  black,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: sf_pro_display_bold,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: HeightData.sixteen,

                                ),
                                textAlign: TextAlign.left
                            ),

                          );
                        },
                      ),

                  )
              ),
            ];
          },
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0,),

              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Enter the confirmation code we sent to dm2group@gmail.com
                    Text(pcikausername,
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
                      child: TextFormField(
                          style: checkTextColor == true ? const TextStyle(color: Colors.black) : TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Username",
                            suffixIcon: checkTextColor == true ? Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(cross,width: 5,height: 5,),
                            ):SizedBox(),
                            hintStyle: TextStyle(color: grey_96a6a3,fontSize: 14,fontFamily: sf_pro_display_medium),
                            fillColor:checkFillColor == true ? Colors.white : grey_e9ecec,
                            filled: true,
                            focusedBorder: checkBorder == true
                                ? const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.red),
                            )
                                : const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide:
                              BorderSide(width: 1, color:  grey_e9ecec),
                            ),
                            enabledBorder: checkBorder == true
                                ? const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.red),
                            )
                                : const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide:
                              BorderSide(width: 1, color: Colors.transparent),
                            ),
                            border: checkBorder == true
                                ? const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.red),
                            )
                                : const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color:skygreen_24d39e),
                            ),

                          ),
                          controller: controller.userNameText.value,
                          onChanged: (inputValue) {
                            if (inputValue != "") {
                              setState(() {
                                checkBorder = isNumeric(inputValue);
                                checkTextColor = true;
                                checkFillColor = true;
                              });
                            } else {
                              setState(() {
                                checkBorder = false;
                                checkFillColor = false;
                                checkTextColor = false;
                              });
                            }
                          }),
                    ),

                    SizedBox(
                      height: 32,
                    ),

                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x17747796).withOpacity(0.07),
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: Offset(0, 20), // changes position of shadow
                        ),
                      ]
                  ),
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
                          if(controller.userNameText.value.text.isEmpty){
                            snackBar(context, "Enter Username");
                            return;
                          }
                          checkNet(context).then((value) {
                            controller.callUsernamePswdApi(context,"1");
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: skygreen_24d39e,
                          onPrimary: Colors.white,
                          elevation: 0,
                          padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 21),
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
      )),
    );
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
