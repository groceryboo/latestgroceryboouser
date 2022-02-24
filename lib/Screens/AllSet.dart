import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Screens/Dashboard/view/BottomNavigation.dart';
import 'package:groceryboouser/Screens/Homepage/view/HomepageView.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';


class AllSet extends StatefulWidget {

  @override
  _AllSetState createState() => _AllSetState();
}

class _AllSetState extends State<AllSet> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:  Colors.white, // navigation bar color
      statusBarColor:  Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.light, //navigation bar icons' color
    ));

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height: 65,),
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          // Container(
                          //   height: 6.0,
                          //   width: 300,
                          //   decoration: const BoxDecoration(color: green_24d39e),
                          // ),
                          Expanded(
                            child: Container(
                              height: 7.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: skygreen_24d39e,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(6),
                                      topLeft: Radius.circular(6),
                                      bottomLeft: Radius.circular(6),
                                      bottomRight: Radius.circular(6))),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 65,
                      ),
                      SizedBox(height: 100,),
                      SvgPicture.asset(done_green1,width: 72,height: 72,),
                      SizedBox(height: 40,),
                      // Add Profile Photo
                      Text(
                          youin,
                          style:  TextStyle(
                              color: black,
                              fontWeight: FontWeight.w700,
                              fontFamily: sf_pro_display_bold,
                              fontStyle:  FontStyle.normal,
                              fontSize: 24.0
                          ),
                          textAlign: TextAlign.left
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 24,right: 24,bottom: 34),
                child: Column(
                  children: [
                    // ContinueGreenButton(lets_go),
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
                            lets_go,
                            14,
                            Colors.white,
                            FontWeight.w500,
                            FontStyle.normal,
                            TextAlign.center), // Button
                        onPressed: () {
                          Get.off(BottomNavigation());
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
        ));
  }
}
