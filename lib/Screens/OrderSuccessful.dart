import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryboouser/Screens/BottomNavigation.dart';
import 'package:groceryboouser/Screens/Pinned/view/SetPinnedBasket.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';

class OrderSuccessful extends StatelessWidget {
  String is_pinned;
  int id;

  OrderSuccessful({this.is_pinned,this.id});

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
              SizedBox(
                height: 60,
              ),
              Center(child: Text(
                Your_order_successfull,
                style: TextStyle(
                    fontFamily: sf_pro_display_bold,
                    fontSize: 26,
                    color: black_273433,height: 1.2,fontWeight: FontWeight.w700,
                  fontStyle:  FontStyle.normal,),
                    textAlign: TextAlign.center,
              )),

              SizedBox(
                height: 53,
              ),
              Center(child: Image.asset(order_successfull,width: 244.1,height: 240.3,)),

              Center(child: Text(
                Your_items_placed_processed,
                style: TextStyle(
                    fontFamily: sf_pro_display_medium,
                    fontSize: 14,
                    color: grey_96a6a3,height: 1.5,
                  fontWeight: FontWeight.w500,
                  fontStyle:  FontStyle.normal,),
                textAlign: TextAlign.center,
              )),

              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x17747796).withOpacity(0.0),
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: Offset(0, 20), // changes position of shadow
                      ),
                    ]
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 24,right: 24,top: 56),
                  child: ElevatedButton(
                      child: //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          // Add to basket
                          Text(Pinned_basket,
                              style:  TextStyle(
                                  color:  Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: sf_pro_display_semibold,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 16.0
                              ),
                          ),
                          SizedBox(width: 8,),
                          RotatedBox(quarterTurns:2,child: SvgPicture.asset(BackArrow,color: Colors.white,)),

                        ],
                      ), // Button
                      onPressed: () {
                        if(is_pinned=="yes"){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => SetPinnedBasket(order_id: id),
                          ));
                        }else{
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => BottomNavigation(),
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: skygreen_24d39e,
                        onPrimary: Colors.white,
                        elevation: 0,
                        padding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: skygreen_24d39e, width: 0),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              const Divider(
                color: silver_f4f6f6,
                thickness: 1.1,
              ),
              SizedBox(
                height: 29,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(track_order_location,height: 18,width: 18,),
                    SizedBox(width: 8,),
                    // Add to basket
                    Text(Track_my_order,
                      style:  TextStyle(
                          color:  black_273433,
                          fontWeight: FontWeight.w600,
                          fontFamily: sf_pro_display_semibold,
                          fontStyle:  FontStyle.normal,
                          fontSize: 16.0
                      ),
                    ),

                  ],
                ),
              ), // Button

            ],
          ),
        ),
      ),
    );
  }
}
