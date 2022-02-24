import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/controller/profilecon.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/view/SyncContactsView.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';

class AddProfilePhoto extends StatefulWidget {
  @override
  _AddProfilePhotoState createState() => _AddProfilePhotoState();
}

class _AddProfilePhotoState extends State<AddProfilePhoto> {
  ProfileController controller = Get.put(ProfileController());

  double beginWidth = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,width: 20),
              BackLayout(),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Container(
                height: 6.0,
                width: 100,
                decoration: const BoxDecoration(color: skygreen_24d39e),
              ),
              Expanded(
                child: Container(
                  height: 7.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: grey_e9ecec,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6),
                          bottomRight: Radius.circular(6))),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 65,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                children: [
                  imagePath.toString() != "File: ''"
                      ? SizedBox(
                          width: 150.0,
                          height: 150.0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.file(
                                imagePath,
                                // imagePath,

                                fit: BoxFit.fill,
                              )))
                      : InkWell(
                          onTap: () => {
                                selectPhoto(),
                              },
                          child: Image.asset(
                            addphoto,
                            width: 260,
                            height: 260,
                          )),

                  // Add Profile Photo
                  Text(addphotos,
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w700,
                          fontFamily: sf_pro_display_bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 24.0),
                      textAlign: TextAlign.left),
                  SizedBox(
                    height: 10,
                  ),
                  // Add a profile photo so your friends know it’s you.
                  Text(add_photo_desc,
                      style: TextStyle(
                          color: grey_aaaaaa,
                          fontWeight: FontWeight.w500,
                          fontFamily: sf_pro_display_medium,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left)
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 34),
            child: Column(
              children: [
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
                                add_photo_profile,
                                14,
                                Colors.white,
                                FontWeight.w500,
                                FontStyle.normal,
                                TextAlign.center), // Button
                        onPressed: () {
                          if (imagePath.toString() != "File: ''") {
                            controller.callProfileApi(context, imagePath.path.toString());
                          } else {
                            snackBar(context, "Add Photo");
                          }
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
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () => Get.to(SyncContacts()),
                  child: SizedBox(
                    width: double.infinity,
                    height: HeightData.sixty,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: skygreen_24d39e, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: // SKIP, NOT NOW
                          Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(skip_not_now,
                              style: TextStyle(
                                  color: skygreen_24d39e,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: sf_pro_display_bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.left),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  selectPhoto() {
    showImagePicker(context).then((value) {
      setState(() {});
      print(imagePath.toString());
    });
  }

}
