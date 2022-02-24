import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import '../Model/MarketModel.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';


class Market extends StatefulWidget {
  const Market({Key key}) : super(key: key);

  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {

  bool isFirst = true;
  bool isSecond = false;

  @override
  Widget build(BuildContext context) {
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
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 24,right: 24,top: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Deliver to
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isFirst = false;
                                    isSecond = true;
                                  });
                                },
                                child: Visibility(
                                  visible:isFirst,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Deliver to",
                                          style:  TextStyle(
                                              color:  grey_96a6a3,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: sf_pro_display_medium,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 11.0
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                      Row(
                                        children: [
                                          // 1226 University Dr
                                          Text(
                                              "1226 University Dr",
                                              style:  TextStyle(
                                                  color:  const Color(0xff273433),
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: sf_pro_display_bold,
                                                  fontStyle:  FontStyle.normal,
                                                  fontSize: 14.0
                                              ),
                                              textAlign: TextAlign.left
                                          ),
                                          SizedBox(width: 4,),
                                          SvgPicture.asset(down_arrow,width: 10,height: 10,),

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isFirst = true;
                                    isSecond = false;
                                  });
                                },
                                child: Visibility(
                                  visible:isSecond,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: grey_e9ecec
                                        ),
                                        child: Icon(Icons.person),
                                      ),
                                      SizedBox(width: 10,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Deliver to uyi
                                          Text(
                                              "Deliver to uyi ",
                                              style:  TextStyle(
                                                  color:   Color(0xff273433),
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: sf_pro_display_bold,
                                                  fontStyle:  FontStyle.normal,
                                                  fontSize: 12.0
                                              ),
                                              textAlign: TextAlign.left
                                          ),
                                          Row(
                                            children: [
                                              // 1226 University Dr
                                              Text(
                                                  "1226 University Dr",
                                                  style:  TextStyle(
                                                      color:  grey_96a6a3,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: sf_pro_display_medium,
                                                      fontStyle:  FontStyle.normal,
                                                      fontSize: 11.0
                                                  ),
                                                  textAlign: TextAlign.left
                                              ),
                                              SizedBox(width: 4,),
                                              SvgPicture.asset(down_arrow,width: 10,height: 10,color: grey_96a6a3,),

                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(notification_icon,width: 18,height: 18,),
                              SizedBox(width: 15,),
                              SvgPicture.asset(message_icon,width: 18,height: 18,),
                              SizedBox(width: 15,),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 16,),
                      /*Search Layout Below Side*/
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: grey_e9ecec,
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: 15,right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(search,width: 16.3,height: 16.3,),
                              SizedBox(width: 7.7,),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: new TextField(
                                    style: const TextStyle(
                                        color:   black,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: sf_pro_display_medium,
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 12.0),
                                    decoration: new InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                                      hintText: "Search for store...",
                                      hintStyle: TextStyle(
                                          color:   grey_96a6a3,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: sf_pro_display_medium,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 12.0),
                                      border: InputBorder.none,

                                    ),
                                    keyboardType: TextInputType.text,
                                    cursorColor: black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ),
                      SizedBox(height: 16,),
                      ListView.builder(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        primary: false,
                        shrinkWrap: true,
                        itemCount: marketModel.length,
                        itemBuilder: (context, i) => Container(
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.only(top: 0, right: 0, left: 0, bottom: 16),
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


              ],
            ),
          ),
        ));
  }
}
