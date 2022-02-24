import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryboouser/Model/PinnedGridModel.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';

import '../../../Layouts/ToolbarBackOnly.dart';

class PinnedDetailsOwn extends StatefulWidget {
  @override
  _PinnedDetailsOwnState createState() => _PinnedDetailsOwnState();
}



class _PinnedDetailsOwnState extends State<PinnedDetailsOwn> {
  String descText =
      "Donec laoreet, nulla quis auctor porta, orci augue sodales est, in ultricies sapien massa in lacus. Aenean magna nisl, varius sit amet ligula et, faucibus consequat mauris. In luctus ex quis dolor pulvinar, vel egestas tortor ultrices."
      "\nIn eget varius metus. Suspendisse ultricies magna in tincidunt tincidunt. Aenean quis est at sem ultrices efficitur eget ac elit. Nam dapibus tortor tincidunt orci ultricies blandit. Quisque maximus metus eu lectus tempor, sit amet porta dolor aliquam. Praesent volutpat elit ipsum, placerat volutpat leo eleifend sed.";
  bool descTextShowFlag = false;
  List<PinnedGridModel> onPinnedGridModel = [
    PinnedGridModel('assets/images/lemon.png', 'Lemon', '1.5 kg', '\$25'),
    PinnedGridModel('assets/images/watermelon.png', 'Watermelon', '3 kg', '\$30'),
    PinnedGridModel('assets/images/avocado.png', 'Avocado', '1 kg', '\$20'),
    PinnedGridModel('assets/images/lemon.png', 'Lemon', '1.5 kg', '\$25'),
    PinnedGridModel('assets/images/watermelon.png', 'Watermelon', '3 kg', '\$30'),
    PinnedGridModel('assets/images/avocado.png', 'Avocado', '1 kg', '\$20'),
  ];

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
                  padding: EdgeInsets.only(top: 8, right: 24, left: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Align(
                          alignment: Alignment.centerLeft,
                          child: BackLayout())),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(24)),
                                color: skygreen_24d39e),
                            child: Text(
                              boost,
                              style: TextStyle(
                                  fontFamily: sf_pro_display_bold,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white),

                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      SvgPicture.asset(
                        edit_note,
                        width: 28,
                        height: 28,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: CircularProfileAvatar(
                          '',
                          child: Image.asset('assets/images/girl.png'),
                          borderColor: skygreen_24d39e,
                          borderWidth: 1,
                          elevation: 2,
                          radius: 50,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Pinned by Kelly
                            Text("Pinned by Kelly",
                                style: TextStyle(
                                    color: black_273433,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: sf_pro_display_medium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left),

                            Row(
                              children: [
                                SvgPicture.asset(
                                  time,
                                  width: 12,
                                  height: 12,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                // 2hrs ago
                                Text("2hrs ago",
                                    style: TextStyle(
                                        color: grey_96a6a3,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: sf_pro_display_regular,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 11.0),
                                    textAlign: TextAlign.left)
                              ],
                            )
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        circle_dots,
                        width: 28,
                        height: 28,
                      )
                    ],
                  ),
                ),


                Container(
                  padding: EdgeInsets.all(16.0),
                  margin:
                      EdgeInsets.only(top: 24, right: 24, left: 24, bottom: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x144343b2),
                          offset: Offset(0, 0),
                          blurRadius: 20,
                          spreadRadius: 2)
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  repinned,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: sf_pro_display_medium,
                                    color: grey_96a6a3,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      five_hundred,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: sf_pro_display_bold,
                                        color: black,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    
                                    Container(
                                        margin:EdgeInsets.only(top: 2,left: 56),child: RotatedBox(quarterTurns:2  ,child: SvgPicture.asset(BackArrow,height: 12,width: 12,)))
                                    
                                  ],
                                ),
                                SizedBox(
                                  height: 17,
                                ),
                                Text(
                                  commission_earned,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: sf_pro_display_medium,
                                    color: grey_96a6a3,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  doller_fifty,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: sf_pro_display_bold,
                                    color: black,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  purchased,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: sf_pro_display_medium,
                                    color: grey_96a6a3,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      five_hundred,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: sf_pro_display_bold,
                                        color: black,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),

                                    Container(
                                        margin:EdgeInsets.only(top: 2,left: 56),child: RotatedBox(quarterTurns:2  ,child: SvgPicture.asset(BackArrow,height: 12,width: 12,)))

                                  ],
                                ),

                              ],
                            ),
                            flex: 1,

                          )
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 24,
                ),
                // Anne Baker Birthday 🎉
                Container(
                  margin: EdgeInsets.only(left: 24),
                  child: Text("Anne Baker Birthday 🎉",
                      style: TextStyle(
                          color: black_273433,
                          fontWeight: FontWeight.w600,
                          fontFamily: sf_pro_display_semibold,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.center),
                ),
                SizedBox(
                  height: 17,
                ),
                Container(
                    margin: EdgeInsets.only(left: 24, right: 24),
                    child: Image.asset(
                      cherry_with_orange,
                      width: double.infinity,
                      height: 248,
                      fit: BoxFit.fill,
                    )),
                SizedBox(
                  height: 17,
                ),
                Container(
                  margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  height: 1,
                  color: Color(0xfff4f6f6),
                ),

                SizedBox(
                  height: 16,
                ),

                Container(
                  margin: EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Container(
                          height: 30,
                          width: 40,
                          // alignment: FractionalOffset.center,
                          child: new Stack(
                            //alignment:new Alignment(x, y)
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProfileAvatar(
                                  '',
                                  child: Image.asset('assets/images/girl.png'),
                                  borderColor: Colors.white,
                                  borderWidth: 1,
                                  elevation: 2,
                                  radius: 50,
                                ),
                              ),
                              new Positioned(
                                left: 10.0,
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProfileAvatar(
                                    '',
                                    child:
                                        Image.asset('assets/images/girl.png'),
                                    borderColor: Colors.white,
                                    borderWidth: 1,
                                    elevation: 2,
                                    radius: 50,
                                  ),
                                ),
                              ),
                              new Positioned(
                                left: 20.0,
                                child: SvgPicture.asset(
                                  black_more_dot_icon,
                                  width: 22,
                                  height: 22,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          flex: 1,
                          child: setRegulerText(
                              "Kelly & 3,500+ pinned this",
                              12,
                              grey_96a6a3,
                              FontWeight.w500,
                              FontStyle.normal)),
                      SvgPicture.asset(
                        bookmark,
                        width: 32,
                        height: 32,
                      ),
                      SvgPicture.asset(
                        share_btn,
                        width: 32,
                        height: 32,
                      ),
                    ],
                  ),
                ),

                /*Hide Show Description*/
                Container(
                  margin: EdgeInsets.only(left: 24, right: 24),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        descText,
                        style: TextStyle(
                            fontFamily: sf_pro_display_regular,
                            fontSize: 14,
                            color: grey_96a6a3),
                        maxLines: descTextShowFlag ? 12 : 5,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            descTextShowFlag = !descTextShowFlag;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            descTextShowFlag
                                ? setBoldText("Read less", 12, skygreen_24d39e,
                                    FontWeight.w500, FontStyle.normal)
                                : setBoldText("Read More", 12, skygreen_24d39e,
                                    FontWeight.w500, FontStyle.normal),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 7,
                ),

                Container(
                  margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  height: 1,
                  color: Color(0xfff4f6f6),
                ),

                SizedBox(
                  height: 14,
                ),

                Container(
                  margin: EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: setSemiBoldText("List items on this basket", 14,
                              black_273433, FontWeight.w700, FontStyle.normal)),
                      SvgPicture.asset(
                        light_bag,
                        width: 12,
                        height: 12,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      setMediumSFProText("6 items", 12, grey_96a6a3,
                          FontWeight.w500, FontStyle.normal)
                    ],
                  ),
                ),

                SizedBox(
                  height: 14,
                ),

                Container(
                  margin: EdgeInsets.only(left: 24, right: 24),
                  decoration: BoxDecoration(
                    border: Border.all(color: grey_e9ecec, width: 1),
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xfff5f8f8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          info,
                          width: 15,
                          height: 15,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          flex: 1,
                          child: setRegulerText(
                              "Some of the items is out of stock. Wanna replace it ? we will suggest you the preferred item.",
                              12,
                              grey_96a6a3,
                              FontWeight.w500,
                              FontStyle.normal),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 13,
                ),

                Container(
                  margin: EdgeInsets.only(left: 24, right: 24),
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    primary: false,
                    shrinkWrap: true,
                    // padding: EdgeInsets.all(0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.60,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 13.0),
                    itemCount: onPinnedGridModel.length,
                    itemBuilder: (BuildContext context, int i) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.asset(
                              onPinnedGridModel[i].image,
                              width: double.infinity,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: SvgPicture.asset(
                                    delete_black,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        setMediumSFProText(onPinnedGridModel[i].title, 14,
                            black_273433, FontWeight.w600, FontStyle.normal),
                        SizedBox(height: 2,),
                        setRegulerText(onPinnedGridModel[i].quantity, 11,
                            grey_96a6a3, FontWeight.w500, FontStyle.normal),
                        SizedBox(height: 2,),
                        setMediumSFProText(onPinnedGridModel[i].price, 14,
                            skygreen_24d39e, FontWeight.w500, FontStyle.normal)
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 24,right:24,bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 19, horizontal: 21),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.5, color: skygreen_24d39e),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white),
                        child: Text(
                          add_more,
                          style: TextStyle(
                              fontFamily: sf_pro_display_bold,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: skygreen_24d39e),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                            child: //
                                Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Add to basket
                                Text(
                                  purchase_now,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: sf_pro_display_bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "\$ 400",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: sf_pro_display_semibold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                ),
                              ],
                            ), // Button
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: skygreen_24d39e,
                              onPrimary: Colors.white,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: skygreen_24d39e, width: 0),
                              ),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
