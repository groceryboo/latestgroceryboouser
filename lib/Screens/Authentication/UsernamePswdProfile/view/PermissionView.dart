import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Screens/Authentication/UsernamePswdProfile/view/AddProfilePhotoView.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:location/location.dart';

class Permission extends StatefulWidget {
  @override
  _PermissionState createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {

  bool status = false;
  bool statussecond = false;
  bool isSwitchedPush = false;
  // bool _serviceEnabled = false;

  bool isChecked = false;

  Location location = new Location();

  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData _locationData;

  Future<String> permissionStatusFuture;

  var permGranted = "granted";
  var permDenied = "denied";
  var permUnknown = "unknown";
  var permProvisional = "provisional";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: skygreen_24d39e, // navigation bar color
      statusBarColor: skygreen_24d39e, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));

    return SafeArea(
        child: Scaffold(
      backgroundColor: skygreen_24d39e,
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 65),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // We needs these permissions for a smooth experience.
                  Text(weneed,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: sf_pro_display_bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 28.0,
                          height: 1.3),
                      textAlign: TextAlign.left),

                  SizedBox(
                    height: 40,
                  ),

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: black),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Push Notifications
                              Text(push_notification,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: sf_pro_display_bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.center),

                              FlutterSwitch(
                                width: 40.0,
                                height: 20.0,
                                activeColor: skygreen_24d39e,
                                inactiveColor: Color(0xff3a3a3a),
                                valueFontSize: 0.0,
                                toggleSize: 13.0,
                                value: status,
                                borderRadius: 10.0,
                                padding: 4.0,
                                showOnOff: true,
                                onToggle: (val) {
                                  setState(() {
                                    status = val;

                                  });
                                },
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          // Push notifications are used to provide update on your orders
                          Text(push_notification_disc,
                              style: const TextStyle(
                                  color: grey_96a6a3,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: sf_pro_display_regular,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.left)
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 24,
                  ),

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: black),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Push Notifications
                              Text(enable_location,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: sf_pro_display_bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.center),

                              FlutterSwitch(
                                width: 40.0,
                                height: 20.0,
                                activeColor: skygreen_24d39e,
                                inactiveColor: Color(0xff3a3a3a),
                                valueFontSize: 0.0,
                                toggleSize: 13.0,
                                value: statussecond,
                                borderRadius: 10.0,
                                padding: 4.0,
                                showOnOff: true,
                                onToggle: (val) {
                                  setState(() {
                                    statussecond = val;
                                    if (val == true) {
                                      _permissionGranted =
                                          PermissionStatus.granted;
                                    }else{
                                      _permissionGranted =
                                          PermissionStatus.denied;
                                    }
                                    snackBar(context, _permissionGranted.toString());

                                  });
                                },
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          // Push notifications are used to provide update on your orders
                          Text(enable_location_disc,
                              style: TextStyle(
                                  color: grey_96a6a3,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: sf_pro_display_regular,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.left)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            // You can change this in setting at any time.
            Text(you_can_change,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                    fontFamily: sf_pro_display_medium,
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0),
                textAlign: TextAlign.center),

            // Setting it later.
            InkWell(
              onTap: ()=>{
              Get.off(AddProfilePhoto()),
            },
              child: Text(setting_in_letter,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: sf_pro_display_bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.center),
            ),

            SizedBox(
              height: 40,
            ),

          ],
        ),
      ),
    ));
  }

}
