import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';


class TrxnPinCommisionDetail extends StatefulWidget {
  const TrxnPinCommisionDetail({Key key}) : super(key: key);

  @override
  _TrxnPinCommisionDetailState createState() => _TrxnPinCommisionDetailState();
}

class _TrxnPinCommisionDetailState extends State<TrxnPinCommisionDetail> {
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
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                child: Stack(
                  children: [
                    BackLayout(),
                    Align(
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(height: 4,),
                            Text(
                              pin_commission,
                              style: TextStyle(
                                fontSize: 18,
                                color: black_273433,
                                fontFamily: sf_pro_display_bold,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            Text(timing,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: sf_pro_display_regular,
                                  color: black_273433,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.center)
                          ],
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
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(top: 18, right: 24, left: 24),
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
                    Text(pin_name,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: sf_pro_display_bold,
                          color: black_273433,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          lemon,
                          height: 55,
                          width: 55,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(birthday,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: sf_pro_display_regular,
                              color: black_273433,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.left),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(top: 16, right: 24, left: 24),
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
                    Text(pin_purchased_by,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: sf_pro_display_bold,
                          color: black_273433,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 41,
                          width: 41,
                          child: CircularProfileAvatar(
                            '',
                            child: Image.asset('assets/images/girl.png'),
                            // borderColor: green_24d39e,
                            // borderWidth: 1,
                            // elevation: 2,
                            // radius: 50,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Elstonbrown,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: sf_pro_display_regular,
                                    color: black_273433,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: 1,
                              ),
                              Text(elston_25,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: sf_pro_display_regular,
                                    color: grey_96a6a3,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.left),
                            ],
                          ),
                          flex: 1,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 5, bottom: 7, left: 16, right: 16),
                          decoration: BoxDecoration(
                            color: skygreen_24d39e,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(follow,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: sf_pro_display_bold,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.start),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(top: 16, right: 24, left: 24),
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
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(pin_value,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: sf_pro_display_bold,
                                color: black_273433,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 5,
                          ),
                          Text($16,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: sf_pro_display_semibold,
                                color: black_273433,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.left),

                        ],
                      ),

                      SizedBox(width: 53,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(commission_earned,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: sf_pro_display_bold,
                                color: black_273433,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 5,
                          ),
                          Text($5,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: sf_pro_display_semibold,
                                color: black_273433,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.left),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
