import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';

class ProductDetailPage extends StatefulWidget {

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  int _n = 1;

  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0)
        _n--;
    });
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:  Colors.transparent, // navigation bar color
      statusBarColor:  Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.light, //navigation bar icons' color
    )
    );

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Stack(
                  children: [
                    Image.asset(dadam,width: double.infinity,),
                    Padding(
                      padding: const EdgeInsets.only(left: 24,right: 25,top: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BackLayout(),
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
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SvgPicture.asset(bag,width: 24,height: 24,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,bottom: 10),
                                  child: Center(
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:Color(0xfffa586a)
                                      ),
                                      child: // 2
                                      Center(
                                        child: Text(
                                            "2",
                                            style:  TextStyle(
                                                color:  Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Poppins",
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 10.0
                                            ),
                                            textAlign: TextAlign.center
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 380,
                        width: double.infinity,
                        child: new Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.white),
                              borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(20.0),
                                topRight: const Radius.circular(20.0),
                              )
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Padding(
                                padding:  EdgeInsets.only(left: 24,right: 24,top: 24,bottom: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Pomegranate
                                        Text(
                                            "Pomegranate",
                                            style:  TextStyle(
                                                color:  black_273433,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: sf_pro_display_bold,
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 24.0
                                            ),
                                            textAlign: TextAlign.left
                                        ),

                                        // $1.5
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                                "\$1.5",
                                                style: const TextStyle(
                                                    color:  black_273433,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: sf_pro_display_semibold,
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 28.0
                                                ),
                                                textAlign: TextAlign.left
                                            ),

                                            // / 1kg
                                            Text(
                                                "/ 1kg",
                                                style:  TextStyle(
                                                    color:  grey_96a6a3,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: sf_pro_display_medium,
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 12.0
                                                ),
                                                textAlign: TextAlign.left
                                            )
                                          ],
                                        )
                                      ],
                                    ),

                          new Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: grey_e9ecec
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  Container(
                                    width: 24,
                                    height: 24,
                                    child: new FloatingActionButton(
                                      onPressed: minus,
                                      elevation: 0,
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(6),

                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: SvgPicture.asset(minus_icon,),
                                        ),
                                      ),
                                      backgroundColor: Colors.white,),
                                  ),

                                  SizedBox(width: 15,),

                                  // 1
                                  SizedBox(
                                    width: 20,
                                    child: Center(
                                      child: Text(
                                          '$_n',
                                          style:  TextStyle(
                                              color:  black_273433,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: sf_pro_display_bold,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 16.0,
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  Container(
                                    width: 24,
                                    height: 24,
                                    child: new FloatingActionButton(
                                      onPressed: add,
                                      elevation: 0,
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(6),

                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: SvgPicture.asset(plus,),
                                        ),
                                      ),
                                      backgroundColor: Colors.white,),
                                  ),



                                ],
                              ),
                            ),
                          ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                                height: 1,
                                color: Color(0xfff4f6f6),
                              ),

                              Padding(
                                padding:  EdgeInsets.only(left: 24,right: 24,top: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Description
                                    Text(
                                        "Description",
                                        style: const TextStyle(
                                            color:  const Color(0xff273433),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: sf_pro_display_bold,
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 14.0
                                        ),
                                        textAlign: TextAlign.left
                                    ),// The pomegranate was originally described throughout the Mediterranean region. It was introduced into
                                    SizedBox(height: 10,),
                                    Text(
                                        "The pomegranate was originally described throughout the Mediterranean region. It was introduced into Spanish America in the late 16th century.",
                                        style:  TextStyle(
                                            color:  grey_96a6a3,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: sf_pro_display_regular,
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 14.0
                                        ),
                                        textAlign: TextAlign.left
                                    ),

                                    SizedBox(height: 37,),

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
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(white_bag),
                                              SizedBox(width: 16,),
                                              // Add to basket
                                              Text(
                                                  "Add to basket",
                                                  style:  TextStyle(
                                                      color:  Colors.white,
                                                      fontWeight: FontWeight.w700,
                                                      fontFamily: sf_pro_display_bold,
                                                      fontStyle:  FontStyle.normal,
                                                      fontSize: 16.0
                                                  ),
                                                  textAlign: TextAlign.left
                                              )
                                            ],
                                          ), // Button
                                            onPressed: () {},
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
                                    )
                                  ],
                                ),
                              )

                            ],),
                        ),

                      ),
                    )
              ]),
            ),
          ),


        ],
      ),
    );
  }
}
