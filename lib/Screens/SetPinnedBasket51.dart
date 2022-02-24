import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';

import '../Layouts/ElevatedGreenButton.dart';
import '../Layouts/ToolbarBackOnly.dart';
class SetPinnedBasket51 extends StatefulWidget {

  @override
  _SetPinnedBasket51State createState() => _SetPinnedBasket51State();
}

class _SetPinnedBasket51State extends State<SetPinnedBasket51> {
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BackLayout(),
                      Expanded(
                        child: Center(
                          child: Text(
                            set_pinned_basket,
                            style: TextStyle(
                              fontSize: 18,
                              color: black_273433,fontWeight: FontWeight.w700,
                              fontStyle:  FontStyle.normal,
                              fontFamily: sf_pro_display_bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(
                  color: silver_f4f6f6,
                  thickness: 1.3,
                ),

                Container(
                  margin: EdgeInsets.only(top: 24,left: 24,right: 24),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        height: 153,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.green,//Border.all
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Image.asset(cherry_with_orange,fit: BoxFit.fill,height: 153,width: double.infinity,),

                      Container(
                        width: 132,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle, //Border.all
                          borderRadius: BorderRadius.circular(40.0),
                          color: skygreen_24d39e,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(image_uplaod),
                            SizedBox(width: 6,),
                            Text(
                              change_photo,
                              style: TextStyle(
                                  fontSize: 12,fontWeight: FontWeight.w700,
                                  fontStyle:  FontStyle.normal,
                                  fontFamily: sf_pro_display_bold,
                                  color: Colors.white),
                            ),

                          ],
                        ),
                      )

                    ],
                  ),
                ),

                Container(
                    margin: EdgeInsets.only(top: 24, left: 24),
                    child: Text(
                      title_txt,
                      style: TextStyle(
                          fontSize: 16,fontWeight: FontWeight.w700,
                          fontStyle:  FontStyle.normal,
                          fontFamily: sf_pro_display_bold,
                          color: black),
                    )),

                Container(
                  margin: EdgeInsets.only(top: 4, right: 24, left: 24),
                  padding: EdgeInsets.symmetric(vertical: 10.5, horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: grey_e9ecec, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white),
                  child: new TextField(
                    style: const TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontFamily: sf_pro_display_medium,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    decoration: new InputDecoration(
                      isDense: true,
                      hintText: Set_your_pinned_basket,
                      hintStyle: TextStyle(
                          color: grey_96a6a3,
                          fontWeight: FontWeight.w500,
                          fontFamily: sf_pro_display_medium,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                ),

                Container(
                    margin: EdgeInsets.only(top: 16, left: 24),
                    child: Text(
                      description,
                      style: TextStyle(
                          fontSize: 16,fontWeight: FontWeight.w700,
                          fontStyle:  FontStyle.normal,
                          fontFamily: sf_pro_display_bold,
                          color: black),
                    )),

                Container(
                  height: 120,
                  margin: EdgeInsets.only(top: 4, right: 24, left: 24),
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: grey_e9ecec, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white),
                  child: Container(
                    child: new TextField(
                      style: const TextStyle(
                          color: black,
                          fontWeight: FontWeight.w500,
                          fontFamily: sf_pro_display_medium,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      decoration: new InputDecoration(
                        isDense: true,
                        hintText: write_description,
                        hintStyle: TextStyle(
                            color: grey_96a6a3,
                            fontWeight: FontWeight.w500,
                            fontFamily: sf_pro_display_medium,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                    ),
                  ),
                ),

                Container(
                    margin: EdgeInsets.only(top: 16, left: 24),
                    child: Text(
                      set_category,
                      style: TextStyle(
                          fontSize: 16,fontWeight: FontWeight.w700,
                          fontStyle:  FontStyle.normal,
                          fontFamily: sf_pro_display_bold,
                          color: black),
                    )),

                SizedBox(
                  height: 24,
                ),

                /*List view flex Box Layout*/

                Container(
                    margin: EdgeInsets.only(left: 24, right: 24),
                    child: CommonElevatedButton(CONTINUE, Colors.white,skygreen_24d39e,(){})),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
