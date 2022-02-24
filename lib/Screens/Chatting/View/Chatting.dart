import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';

class Chatting extends StatefulWidget {
  const Chatting({Key key}) : super(key: key);

  @override
  _ChattingState createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
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
          backgroundColor: CupertinoColors.white,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 12, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 6,
                              blurRadius: 10,
                              offset: Offset(1, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            BackArrow,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      setBoldSFProText(jennifer_taylor, 18, black_273433,
                          FontWeight.w700, FontStyle.normal),
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 6,
                              blurRadius: 10,
                              offset: Offset(1, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            plus,
                            width: 24,
                            height: 24,
                            color: black_273433,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: grey_e9ecec,
                  thickness: 1,
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 19, right: 19),
                          decoration: BoxDecoration(
                            color: grey_e9ecec,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(date,
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: sf_pro_display_medium,
                                color: black_273433,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.start),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16,right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Align(
                                  // alignment: Alignment.topRight,
                                  child: Text(you,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: sf_pro_display_bold,
                                      color: black_273433,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ),),
                                ),

                                SizedBox(height: 6,),
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: skygreen_24d39e,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                  ),
                                  child: Text(message,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: sf_pro_display_regular,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start),
                                ),

                              ],
                            ),

                            SizedBox(width: 8,),
                            SizedBox(
                              height: 34,
                              width: 34,
                              child: CircularProfileAvatar(
                                '',
                                child: Image.asset('assets/images/girl.png',),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24,left: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 34,
                              width: 34,
                              child: CircularProfileAvatar(
                                '',
                                child: Image.asset('assets/images/girl.png',),
                              ),
                            ),

                            SizedBox(width: 8,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Jennifer,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: sf_pro_display_bold,
                                    color: black_273433,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ),),

                                SizedBox(height: 6,),
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: grey_e9ecec,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(08),
                                      topLeft: Radius.circular(0),
                                      bottomLeft: Radius.circular(08),
                                      bottomRight: Radius.circular(08),
                                    ),
                                  ),
                                  child: Text(message_response,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: sf_pro_display_regular,
                                          color: black_273433,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          height: 1.3
                                      ),
                                      textAlign: TextAlign.start),
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 24,left: 80,top: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 6,
                              blurRadius: 10,
                              offset: Offset(1, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child:Column(

                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [

                                          Container(
                                            width: 40,
                                            height: 40,
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: SweepGradient(
                                                  colors: [
                                                    Color(0xff2ad0ca),
                                                    Color(0xffe1f664),
                                                    Color(0xfffeb0fe),
                                                    Color(0xffabb3fc),
                                                    Color(0xff5df7a4),
                                                    Color(0xff58c4f6),
                                                  ],
                                                  tileMode: TileMode.mirror,
                                                )),
                                            child: SizedBox(
                                              height: 35,
                                              width: 35,
                                              child: CircularProfileAvatar(
                                                '',
                                                child:
                                                Image.asset('assets/images/girl.png',),
                                              ),
                                            ),
                                          ),

                                          SizedBox(width: 9.7,),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(pinned_by_Kelly,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: sf_pro_display_bold,
                                                    color: black_273433,
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                  ),),

                                                SizedBox(height: 5,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [

                                                    SvgPicture.asset(pinned),

                                                    SizedBox(width: 5,),
                                                    RichText(
                                                      text: TextSpan(
                                                          text: pinned_from,
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: grey_96a6a3,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily:
                                                            sf_pro_display_regular,
                                                            fontStyle: FontStyle.normal,
                                                          ),

                                                          children: <TextSpan>[

                                                            TextSpan(
                                                                text:Toribroad,
                                                                style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: sky_blue,
                                                                  fontWeight:
                                                                  FontWeight.w600,
                                                                  fontFamily:
                                                                  sf_pro_display_regular,
                                                                  fontStyle:
                                                                  FontStyle.normal,
                                                                )),
                                                          ]),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            flex: 1,
                                          ),
                                          SvgPicture.asset(next),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 7,),

                                Text(Tori_cooking,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: sf_pro_display_semibold,
                                      color: black_273433,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.start),

                                Container(
                                  margin: EdgeInsets.only(top: 7),
                                  child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: <Widget>[
                                      Container(
                                        height: 194,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.green,//Border.all
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      Image.asset(cherry_with_orange,fit: BoxFit.fill,height: 194,width: double.infinity,),

                                      Container(
                                        width: 120,
                                        height: 40,
                                        margin: EdgeInsets.only(left: 15,bottom: 15),
                                        decoration: BoxDecoration(
                                          color: black,
                                          shape: BoxShape.rectangle, //Border.all
                                          borderRadius: BorderRadius.circular(40.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            purchase_now,
                                            style: TextStyle(
                                                fontSize: 11,fontWeight: FontWeight.w600,
                                                fontStyle:  FontStyle.normal,
                                                fontFamily: sf_pro_display_semibold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),


                                SizedBox(height: 12,),

                                Text(my_favorite_menu,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: sf_pro_display_medium,
                                      color: grey_96a6a3,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.start),
                              ],
                            )




                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24,left: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 34,
                              width: 34,
                              child: CircularProfileAvatar(
                                '',
                                child: Image.asset('assets/images/girl.png',),
                              ),
                            ),

                            SizedBox(width: 8,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Jennifer,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: sf_pro_display_bold,
                                    color: black_273433,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ),),

                                SizedBox(height: 6,),
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: grey_e9ecec,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(08),
                                      topLeft: Radius.circular(0),
                                      bottomLeft: Radius.circular(08),
                                      bottomRight: Radius.circular(08),
                                    ),
                                  ),
                                  child: Text(typing,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: sf_pro_display_regular,
                                          color: skygreen_24d39e,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          height: 1.3
                                      ),
                                      textAlign: TextAlign.start),
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ],),
                  ),
                  flex: 1,
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24,top: 15,bottom: 15),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grey_e9ecec),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(
                              color: black,
                              fontWeight: FontWeight.w500,
                              fontFamily: sf_pro_display_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          decoration: new InputDecoration(
                            isDense: true,
                            hintText: type_your_message,
                            hintStyle: TextStyle(
                                color: grey_96a6a3,
                                fontWeight: FontWeight.w500,
                                fontFamily: sf_pro_display_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.multiline,
                        ),
                        flex: 1,
                      ),

                      SvgPicture.asset(picture_select),
                      SizedBox(width: 12,),
                      SvgPicture.asset(message_send),
                    ],
                  ),
                ),

              ],
            ),

        ),
      ),
    );
  }
}
