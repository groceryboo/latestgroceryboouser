import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';

class TrxnDetailTopupFailed extends StatefulWidget {
  const TrxnDetailTopupFailed({Key key}) : super(key: key);

  @override
  _TrxnDetailTopupFailedState createState() => _TrxnDetailTopupFailedState();
}

class _TrxnDetailTopupFailedState extends State<TrxnDetailTopupFailed> {
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
                              transaction_failed,
                              style: TextStyle(
                                fontSize: 18,
                                color: pink_fa586a,
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
                                  color: pink_fa586a,
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
                    Text(payment_request,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: sf_pro_display_regular,
                            color: pink_fa586a,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            height: 1.35
                        ),
                        textAlign: TextAlign.left),

                    SizedBox(height: 14,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(transaction_iD,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: sf_pro_display_medium,
                                    color: grey_96a6a3,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.start),
                              SizedBox(
                                height: 1.5,
                              ),
                              Text(id,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: sf_pro_display_medium,
                                    color: black_273433,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.left),
                            ],
                          ),
                          flex: 1,
                        ),

                        Container(
                          padding: EdgeInsets.only(top: 3,bottom: 5,left: 14,right: 14),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: grey_e9ecec,
                                width: 1,
                              )),
                          child: Text(copy,
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: sf_pro_display_regular,
                                color: skygreen_24d39e,
                                fontWeight: FontWeight.w500,
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
                margin: EdgeInsets.only(top: 28, right: 24, left: 24),
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
                    Text(payment_to,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: sf_pro_display_bold,
                          color: black_273433,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left),

                    SizedBox(height: 5,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(wallet_top_up,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: sf_pro_display_regular,
                                color: black_273433,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.left),
                          flex: 1,
                        ),
                        Text($16,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: sf_pro_display_bold,
                              color: black_273433,
                              fontWeight: FontWeight.w700,
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
                margin: EdgeInsets.only(top: 28, right: 24, left: 24),
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
                    Text(debited_from,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: sf_pro_display_bold,
                          color: black_273433,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left),

                    SizedBox(height: 5,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(card_no_31231,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: sf_pro_display_regular,
                                color: black_273433,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.left),
                          flex: 1,
                        ),
                        Text($16,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: sf_pro_display_bold,
                              color: black_273433,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.left),
                      ],
                    )
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
