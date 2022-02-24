import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';

import '../Layouts/ElevatedGreenButton.dart';
import '../Layouts/ToolbarBackOnly.dart';

class CurrentLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 7, left: 24),
                  child: BackLayout()),
              SizedBox(
                height: 37,
              ),
              Center(
                  child: Image.asset(
                delivery_man_riding,
                height: 258,
                width: 258,
              )),
              SizedBox(
                height: 31,
              ),
              Center(
                  child: Text(
                current_location,
                style: TextStyle(
                    fontFamily: sf_pro_display_bold,
                    fontSize: 26,fontWeight: FontWeight.w700,
                    fontStyle:  FontStyle.normal,
                    color: black),
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                access_your_location,
                style: TextStyle(
                    fontFamily: sf_pro_display_medium,
                    fontSize: 14,fontWeight: FontWeight.w500,
                    fontStyle:  FontStyle.normal,
                    color: grey_aaaaaa),
              )),
              SizedBox(
                height: 25,
              ),
              Container(
                  margin: EdgeInsets.only(right: 24, left: 24),
                  child: CommonElevatedButton(agree, Colors.white,skygreen_24d39e,(){})),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        style: TextStyle(
                            color: Color(0xffaaaaaa),
                            fontWeight: FontWeight.w400,
                            fontFamily: sf_pro_display_regular,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        text: already_account),
                    TextSpan(
                        style: TextStyle(
                            color: skygreen_24d39e,
                            fontWeight: FontWeight.w700,
                            fontFamily: sf_pro_display_bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        text: signin)
                  ])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
