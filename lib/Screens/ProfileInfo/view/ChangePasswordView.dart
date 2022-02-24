import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
import 'package:groceryboouser/Layouts/ToolbarWithHeader.dart';
import 'package:groceryboouser/Screens/Dashboard/view/BottomNavigation.dart';
import 'package:groceryboouser/Screens/ProfileInfo/controller/ChangePasswordController.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Utils/SizeConfig.dart';
import 'package:groceryboouser/Utils/internet_connection.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import '../../../Styles/my_colors.dart';
import '../../../Utilities/Constant.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  ChangePasswordController _controller = Get.put(ChangePasswordController());

  bool checkColor = false;
  bool checkColorNp = false;
  bool checkColorCp = false;
  bool checkFillColor = true;
  bool checkFillColorNp = true;
  bool checkFillColorCp = true;
  bool active = false;
  bool activeNp = false;
  bool activeCp = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.05,
              vertical: SizeConfig.screenHeight * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToolbarWithHeader('Change Password', false),
              Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 3
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: grey_e9ecec,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: checkFillColor ? grey_e9ecec : Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        // you can change this with the top text like you want
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        hintText: 'Current Password',
                        hintStyle: TextStyle(
                            color: black,
                            fontFamily: sf_pro_display_medium,
                            fontSize: 14),
                        border: InputBorder.none,
                        filled: false,
                      prefixIcon: SvgPicture.asset(
                        icon_lock,
                        color: active ? skygreen_24d39e : black_273433,
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 24,
                        maxWidth: 24,
                        minHeight: 24,
                        minWidth: 24
                      ),
                      suffixIcon: active ?  InkWell(
                        onTap: ()=>{
                        _controller.currentPswdText.value.text = '',
                      },
                        child: SvgPicture.asset(
                          remove,
                          height: 20,
                          width: 20,
                        ),
                      ) : SizedBox(),
                      suffixIconConstraints: BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                        maxWidth: 20,
                        maxHeight: 20
                      )
                    ),
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    controller: _controller.currentPswdText.value,
                    onChanged: (inputValue) {
                      if (inputValue.isNotEmpty) {
                        setState(() {
                          checkFillColor = false;
                          checkColor = true;
                          active = true;
                        });
                      } else {
                        setState(() {
                          checkFillColor = true;
                          active = false;
                        });
                      }
                    },
                    onSubmitted : (String value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          checkFillColor = false;
                          checkColor = false;
                          active = true;
                        });
                      } else {
                        setState(() {
                          checkFillColor = true;
                          active = false;
                        });
                      }
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: grey_e9ecec,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: checkFillColorNp ? grey_e9ecec : Colors.white),
                margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 2
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      // you can change this with the top text like you want
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        hintText: 'New Password',
                        hintStyle: TextStyle(
                            color: black,
                            fontFamily: sf_pro_display_medium,
                            fontSize: 14),
                        border: InputBorder.none,
                        filled: false,
                        prefixIcon: SvgPicture.asset(
                          icon_lock,
                          color: activeNp ? skygreen_24d39e : black_273433,
                        ),
                    prefixIconConstraints: BoxConstraints(
                        maxHeight: 24,
                        maxWidth: 24,
                        minHeight: 24,
                        minWidth: 24
                    ),
                    suffixIcon: activeNp ? InkWell(
                      onTap: ()=>{
                        _controller.newPswdText.value.text = '',
                      },
                      child: SvgPicture.asset(
                        remove,
                        height: 20,
                        width: 20,
                      ),
                    ) : SizedBox(),
                    suffixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        maxWidth: 20,
                        minHeight: 20,
                        minWidth: 20
                    ),),
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    controller: _controller.newPswdText.value,
                    onChanged: (inputValue) {
                      if (inputValue.isNotEmpty) {
                        setState(() {
                          checkFillColorNp = false;
                          checkColorNp = true;
                          activeNp = true;
                        });
                      } else {
                        setState(() {
                          checkFillColorNp = true;
                          activeNp = false;
                        });
                      }
                    },
                    onSubmitted : (String value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          checkFillColorNp = false;
                          checkColorNp = false;
                          activeNp = true;
                        });
                      } else {
                        setState(() {
                          checkFillColorNp = true;
                          activeNp = false;
                        });
                      }
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: grey_e9ecec,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: checkFillColorCp ? grey_e9ecec : Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      // you can change this with the top text like you want
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                            color: black,
                            fontFamily: sf_pro_display_medium,
                            fontSize: 14),
                        border: InputBorder.none,
                        filled: false,
                        prefixIcon: SvgPicture.asset(
                          icon_lock,
                          color: activeCp ? skygreen_24d39e : black_273433,
                        ),
                    prefixIconConstraints: BoxConstraints(
                        maxHeight: 24,
                        maxWidth: 24,
                        minHeight: 24,
                        minWidth: 24
                    ),
                    suffixIcon: activeCp ?  InkWell(
                      onTap: ()=>{
                        _controller.confirmPswdText.value.text = '',
                      },
                      child: SvgPicture.asset(
                        remove,
                        height: 20,
                        width: 20,
                      ),
                    ): SizedBox(),
                    suffixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        maxWidth: 20,
                        minHeight: 20,
                        minWidth: 20
                    )),
                    textInputAction: TextInputAction.done,
                    textAlign: TextAlign.center,
                    controller: _controller.confirmPswdText.value,
                    onChanged: (inputValue) {
                      if (inputValue.isNotEmpty) {
                        setState(() {
                          checkFillColorCp = false;
                          checkColorCp = true;
                          activeCp = true;
                        });
                      } else {
                        setState(() {
                          checkFillColorCp = true;
                          activeCp = false;
                        });
                      }
                    },
                    onSubmitted: (String value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          checkFillColorCp = false;
                          checkColorCp = false;
                          activeCp = true;
                        });
                      } else {
                        setState(() {
                          checkFillColorCp = true;
                          activeCp = false;
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.45,
              ),
              CommonElevatedButton("Save Password", Colors.white, skygreen_24d39e, () {
                FocusScope.of(context).unfocus();

                if(_controller.currentPswdText.value.text.isEmpty){
                  snackBar(context, "Enter current password");
                  return;
                }
                if(_controller.newPswdText.value.text.isEmpty){
                  snackBar(context, "Enter new password");
                  return;
                }if(_controller.confirmPswdText.value.text.isEmpty){
                  snackBar(context, "Enter confirm password");
                  return;
                }
                if(_controller.confirmPswdText.value.text.toString() != _controller.newPswdText.value.text.toString()){
                  snackBar(context, "Password not matched");
                  return;
                }

                checkNet(context).then((value) {
                  _controller.changePasswordAPI(context);

                });

              }),

              // MaterialButton(onPressed: (){_controller.changePasswordAPI(context);},
              // color: skygreen_24d39e,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(8)
              // ),
              // minWidth: SizeConfig.screenWidth,
              // child: Text('Save Password',
              // style: TextStyle(
              //   fontFamily: sf_pro_display_regular,
              //   fontSize: 16,
              //   color: Colors.white
              // ),),
              // padding: EdgeInsets.all(16),)

            ],
          ),
        ),
      ),
    ));
  }
}
