import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
import 'package:groceryboouser/Layouts/ToolbarWithHeader.dart';
import 'package:groceryboouser/Screens/Homepage/view/HomepageView.dart';
import 'package:groceryboouser/Screens/Location/model/AddressPhotoModel.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoAvatar extends StatefulWidget {
  @override
  _AddPhotoAvatarState createState() => _AddPhotoAvatarState();
}

class _AddPhotoAvatarState extends State<AddPhotoAvatar> {
  var selectedImg = 'assets/images/img1.png';
  bool boolStaticImg = true;

  int myPosition = 0;

  List<AddressPhotoModel> list = [
    AddressPhotoModel(img1),
    AddressPhotoModel(img2),
    AddressPhotoModel(img3),
    AddressPhotoModel(img4),
    AddressPhotoModel(img5),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: ToolbarWithHeader(add_to_saved_places, false),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 156,
                    height: 156,
                    alignment: Alignment.center,
                    child: boolStaticImg == false
                        ? imagePath.toString() != "File: ''"
                            ? SizedBox(
                                width: 64,
                                height: 64,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.file(
                                    imagePath,
                                    fit: BoxFit.fill,
                                  ),
                                ))
                            : Image.asset(selectedImg,
                                width: 64,
                                height: 64,
                                alignment: Alignment.center)
                        : Image.asset(
                            selectedImg,
                            width: 64,
                            height: 64,
                            alignment: Alignment.center,
                          ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: grey_e9ecec),
                  ),
                ),
                SizedBox(height: 86),
                Text("You can use avatar below",
                    style: TextStyle(
                        color: black_273433,
                        fontWeight: FontWeight.w500,
                        fontFamily: sf_pro_display_bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                    textAlign: TextAlign.start),
                SizedBox(height: 21),
                Container(
                  height: 75,
                  child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    separatorBuilder: (context, index) => SizedBox(
                      width: 16,
                    ),
                    padding: EdgeInsets.only(left: 8, right: 8),
                    itemBuilder: (context, i) => InkWell(
                      onTap: () {
                        setState(() {
                          boolStaticImg = true;
                          myPosition = i;
                          selectedImg = list[i].img;
                          // if (list[i].selected == true) {
                          //   list[i].selected = false;
                          // } else {
                          //   list[i].selected = true;
                          // }
                        });
                      },
                      child: Container(
                        width: 74,
                        height: 74,
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                list[i].img,
                                width: 27,
                                height: 27,
                                alignment: Alignment.center,
                              ),
                            ),
                            i == myPosition
                                ? Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: Image.asset(
                                      check,
                                      width: 15.3,
                                      height: 15.3,
                                      alignment: Alignment.bottomRight,
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                            color: grey_e9ecec),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.5,
                ),
                Divider(
                  color: gray_f4f6f6,
                  thickness: 1,
                ),
                SizedBox(
                  height: 15.5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => {_getFile(ImageSource.camera)},
                        child: DottedBorder(
                          color: grey_e9ecec,
                          strokeWidth: 2,
                          dashPattern: [6, 3],
                          radius: const Radius.circular(8),
                          child: Container(
                            color: gray_f3f6f6,
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 39, bottom: 39),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      camera,
                                      width: 24,
                                      height: 25,
                                      alignment: Alignment.center,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Open\n Camera",
                                        style: TextStyle(
                                            color: black_273433,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: sf_pro_display_semibold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14),
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => {_getFile(ImageSource.gallery)},
                        child: DottedBorder(
                          color: grey_e9ecec,
                          strokeWidth: 2,
                          dashPattern: [6, 3],
                          radius: const Radius.circular(8),
                          child: Container(
                            color: gray_f3f6f6,
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 39, bottom: 39),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      gallery,
                                      width: 24,
                                      height: 25,
                                      alignment: Alignment.center,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Select from\n library",
                                        style: TextStyle(
                                            color: black_273433,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: sf_pro_display_semibold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14),
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 21,
                ),
                CommonElevatedButton("Continue", Colors.white, skygreen_24d39e,
                    () async {
                  // File image = await getImageFileFromAssets('assets/images/img2.png');
                  // print("Image :==>:" + image.path.toString());
                  // return;
                  var preferences = MySharedPref();

                  preferences.clear(SharePreData.key_SelectedAvatar);
                  preferences.clear(SharePreData.key_SelectedImgPath);

                  if (boolStaticImg == true) {
                    preferences.setString(
                        SharePreData.key_SelectedAvatar, selectedImg);
                    Get.back();
                  } else {
                    if (imagePath.toString() != "File: ''") {
                      preferences.setString(SharePreData.key_SelectedImgPath,
                          imagePath.path.toString());
                      Get.back();
                    } else {
                      snackBar(
                          context, "Please select avatar for address identity");
                    }
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _getFile(ImageSource source) async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: source,
    );

    print("Image Path " + pickedFile.path);

    setState(() {});

    if (pickedFile != null) {
      setState(() {
        boolStaticImg = false;
        myPosition = -1;
      });
      return imagePath = File(pickedFile.path);
    } else {
      return "";
    }
  }

  saveAvatar() {
    Get.to(Homepage());
  }
}
