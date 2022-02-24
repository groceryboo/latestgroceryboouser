import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Screens/AllSet.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/view/FollowFriendsView.dart';
import 'package:groceryboouser/Screens/Homepage/view/HomepageView.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';
import 'package:permission_handler/permission_handler.dart';

class SyncContacts extends StatefulWidget {
  @override
  _SyncContactsState createState() => _SyncContactsState();
}

class _SyncContactsState extends State<SyncContacts> {
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
              // SizedBox(height: 65,),
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 25, width: 20),
                          BackLayout(),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 6.0,
                            width: 200,
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
                      Image.asset(
                        sync_contact,
                        width: 120,
                        height: 117,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      // Add Profile Photo
                      Text(sync_contact1,
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
                      Text(see_if_your,
                          style: TextStyle(
                              color: grey_aaaaaa,
                              fontWeight: FontWeight.w500,
                              fontFamily: sf_pro_display_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Container(
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
                            lets_do_it,
                            14,
                            Colors.white,
                            FontWeight.w500,
                            FontStyle.normal,
                            TextAlign.center), // Button
                        onPressed: () async {
                          if (await Permission.contacts.request().isGranted) {
                            Get.to(FollowFriends());
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
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 34),
                child: Column(
                  children: [

                   // ContinueGreenButton(lets_do_it,skygreen_24d39e,saveAvatar()),
                    SizedBox(height: 16,),

                    //ContinueGreenButton(lets_do_it,skygreen_24d39e),
                    SizedBox(
                      height: 16,
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: HeightData.sixty,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: skygreen_24d39e, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: // SKIP, NOT NOW
                        InkWell(
                          onTap: () => Get.off(AllSet()),
                          child: Center(
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
}

// saveAvatar() {
// Get.to(Homepage());
//
// }
