import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Screens/ProfileInfo/controller/EditProfileController.dart';
import 'package:groceryboouser/Screens/ProfileInfo/controller/UserProfileController.dart';
import 'package:groceryboouser/Screens/ProfileInfo/view/SettingsView.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/internet_connection.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Utils/SizeConfig.dart';
import '../../../Widgets/Actionsheet.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserMyProfileController _controller = Get.put(UserMyProfileController());

  File image;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Obx(
            () => SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.05,
                  vertical: SizeConfig.screenHeight * 0.02),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackLayout(),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                            color: black_273433,
                            fontSize: 18,
                            fontFamily: sf_pro_display_bold),
                      ),
                      MaterialButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_controller.editNameText.value.text.isEmpty) {
                            snackBar(context, "Enter FullName");
                            return;
                          }
                          if (_controller.editUserNameText.value.text.isEmpty) {
                            snackBar(context, "Enter UserName");
                            return;
                          }

                          checkNet(context).then((value) {
                            _controller.editUserProfileAPI(context);
                          });
                        },
                        color: skygreen_24d39e,
                        child: Text(
                          strDone,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: sf_pro_display_bold,
                              fontSize: 12),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minWidth: 66,
                        height: 40,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical,
                  ),
                  Divider(color: grey_e9ecec, thickness: 1),
                  Stack(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.topCenter,
                          child:  CircleAvatar(
                            radius: 50,
                            child: imagePath.toString() != "File: ''" ?
                            ClipRRect(
                              borderRadius:
                              BorderRadius
                                  .circular(
                                  50.0),
                              child: Image.file(
                                imagePath,
                                // imagePath,
                                fit: BoxFit.fill,
                                width: 79,
                                height: 79,
                              ),
                            ) : _controller.strImage.value != "null"
                                ? ClipRRect(
                              borderRadius:
                              BorderRadius
                                  .circular(
                                  50.0),
                              child: Image.network(
                                _controller.strImage.value,
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                                width: 79,
                                height: 79,
                              ),
                            )
                                : CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(orange_img),
                            ),
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 52,
                            top: SizeConfig.blockSizeVertical * 10),
                        child: InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            selectPhoto();

                            // showCupertinoModalPopup(
                            //     context: context,
                            //     builder: (BuildContext context) => ActionSheet()
                            //             .actionSheet(context, onCamera: () {
                            //           FocusScope.of(context).unfocus();
                            //           chooseCameraFile()
                            //               .then((File file) {
                            //                 print("Vrusti Captured "+ file.toString());
                            //           })
                            //               .catchError((onError) {});
                            //         }, onGallery: () {
                            //           FocusScope.of(context).unfocus();
                            //           androidchooseImageFile()
                            //               .then((value) {
                            //             print("Vrusti selected "+ value.toString());
                            //           })
                            //               .catchError((onError) {});
                            //         }, text: "Select profile image"));
                          },
                          child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Color(0xff58C4F6),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: SvgPicture.asset(edit_icon)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Change Profile Photo",
                    style: TextStyle(
                        color: Color(0XFF24d39e),
                        fontWeight: FontWeight.w800,
                        fontFamily: sf_pro_display_bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Card(
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            textField(
                                title: "Name",
                                hint: "Name",
                                controller: _controller.editNameText.value,
                                readonly: false),
                            textField(
                                title: "Username",
                                hint: "Username",
                                controller: _controller.editUserNameText.value,
                                readonly: false),
                            textField(
                                title: "Website",
                                hint: "Website",
                                controller: _controller.editWebsiteText.value,
                                readonly: false),
                            textField(
                                title: "Bio",
                                hint: "Bio",
                                controller: _controller.editBioText.value,
                                readonly: false),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CommonElevatedButton("Personal Information Settings",
                      Colors.white, black_273433, () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Settings()));
                      }),

                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  //   width: SizeConfig.screenWidth,
                  //   child: ElevatedButton(
                  //       child: Padding(
                  //           padding: EdgeInsets.symmetric(vertical: 20),
                  //           child: Text("Personal Information Setting")),
                  //       style: ButtonStyle(
                  //           foregroundColor:
                  //               MaterialStateProperty.all<Color>(Colors.white),
                  //           backgroundColor: MaterialStateProperty.all<Color>(
                  //               Color(0xFF273433)),
                  //           shape: MaterialStateProperty.all<
                  //                   RoundedRectangleBorder>(
                  //               RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(10),
                  //                   side:
                  //                       BorderSide(color: Color(0xFF273433))))),
                  //       onPressed: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => EditProfile()));
                  //       }),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<File> chooseCameraFile() async {
    await ImagePicker.platform
        .pickImage(
      source: ImageSource.camera,
    )
        .then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        //image = new File(value);
      });
      if (image.path != null) {}
    }).catchError((error) {
      print(error.toString());
    });
    return image;
  }

  Future<File> androidchooseImageFile() async {
    await ImagePicker.platform
        .pickImage(
      source: ImageSource.gallery,
    )
        .then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        // image = new File(value,"");
      });
      if (image.path != null) {}
    }).catchError((error) {
      print(error.toString());
    });
    return image;
  }

  Container textField(
      {String title, String hint, TextEditingController controller, readonly}) {
    TextEditingController inputData;
    inputData = controller;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: grey_e9ecec)),
            ),
            child: TextFormField(
              onTap: () {},
              validator: (value) {
                if (value.isEmpty) {
                  return '* Required';
                }
                return null;
              },
              readOnly: readonly,
              controller: inputData,
              maxLines: hint == 'Bio' ? 5 : 1,
              keyboardType: title == 'Mobile Number'
                  ? TextInputType.number
                  : title == 'Email Id'
                  ? TextInputType.emailAddress
                  : TextInputType.text,
              inputFormatters: title == 'Mobile Number'
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : [],
              decoration: InputDecoration(
                  hintText: hint,
                  labelText: hint,
                  floatingLabelStyle: TextStyle(
                      color: skygreen_24d39e,
                      fontFamily: sf_pro_display_medium,
                      fontSize: 12),
                  suffix: InkWell(
                    onTap: () {
                      controller.text = '';
                      if (title == "Name") {
                        _controller.editNameText.value.text = '';
                      } else if (title == "Username") {
                        _controller.editUserNameText.value.text = '';
                      } else if (title == "Website") {
                        _controller.editWebsiteText.value.text = '';
                      } else if (title == "Bio") {
                        _controller.editBioText.value.text = '';
                      }
                    },
                    child: SvgPicture.asset(
                      remove,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  selectPhoto() {
    showImagePicker(context).then((value) {
      setState(() {});
      print(imagePath.toString());
    });
  }
}
