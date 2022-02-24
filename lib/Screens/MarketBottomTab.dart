import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryboouser/Model/MarketModel.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Utilities/Constant.dart';

class MarketBottomTab extends StatefulWidget {
  @override
  _MarketBottomTabState createState() => _MarketBottomTabState();
}

class _MarketBottomTabState extends State<MarketBottomTab> {
  List<MarketModel> marketModel = [
    MarketModel("assets/images/cherry_img.png", "Dmart", "Kingstreet, Ohio", "+100 others product"),
    MarketModel("assets/images/cherry_img.png", "Walmart", "Kingstreet, Ohio", "+100 others product"),
    MarketModel("assets/images/cherry_img.png", "Dmart", "Kingstreet, Ohio", "+100 others product"),
    MarketModel("assets/images/cherry_img.png", "Walmart", "Kingstreet, Ohio", "+100 others product"),
    MarketModel("assets/images/cherry_img.png", "Dmart", "Kingstreet, Ohio", "+100 others product"),
    MarketModel("assets/images/cherry_img.png", "Walmart", "Kingstreet, Ohio", "+100 others product"),
    MarketModel("assets/images/cherry_img.png", "Dmart", "Kingstreet, Ohio", "+100 others product"),
    MarketModel("assets/images/cherry_img.png", "Walmart", "Kingstreet, Ohio", "+100 others product"),
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 23,
                ),
                ListView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  primary: false,
                  shrinkWrap: true,
                  itemCount: marketModel.length,
                  itemBuilder: (context, i) => Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(top: 0, right: 24, left: 24, bottom: 16),
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(12)),
                        boxShadow: [BoxShadow(
                          color: Color(0x144343b2),
                          offset: Offset(0, 0),
                          blurRadius: 20,
                          spreadRadius: 10)
                    ], color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          marketModel[i].imgMarket,
                          width: 80,
                          height: 80,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              marketModel[i].tvTitle,
                              style: TextStyle(
                                  fontFamily: sf_pro_display_medium,
                                  color: black_273433,fontWeight: FontWeight.w500,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              marketModel[i].tvSubTitle,
                              style: TextStyle(
                                  fontFamily: sf_pro_display_regular,
                                  color: grey_96a6a3,
                                  fontWeight: FontWeight.w400,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 12),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  // border: Border.all(width: 0, color: const Color(0xffe9ecec)),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Color(0xffE6F8EF)),

                              child: Text(
                                marketModel[i].tvProducts,
                                style: TextStyle(
                                    fontFamily: sf_pro_display_medium,
                                    color: skygreen_24d39e,
                                    fontWeight: FontWeight.w400,
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
