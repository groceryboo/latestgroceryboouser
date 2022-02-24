import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Model/NotificationListModel.dart';
import 'package:groceryboouser/Model/NotificationTitleModel.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';


class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  /*--------List Title Data Here --------*/
  List<NotificationTitleModel> notificationTitleModel = [
    NotificationTitleModel("New Activity"),
    NotificationTitleModel("Today"),
  ];
  /*--------Sub List Data Here --------*/
  List<NotificationListModel> notificationListModel = [
    NotificationListModel("assets/images/girl.png","Elstonbrown","pinned your post.","15m"),
    NotificationListModel("assets/images/girl.png","Elstonbrown","pinned your Follers.","15m"),
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                child: Stack(
                  children: [
                    BackLayout(),
                    Container(
                      margin: EdgeInsets.only(top: 11),
                      child: Align(
                        child: Expanded(
                          child: Text(
                            notification,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: black,
                              fontFamily: sf_pro_display_bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: grey_e9ecec,
                thickness: 1.1,
              ),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: notificationTitleModel.length,
                  itemBuilder: (context, i) => Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 24),
                              child: Text(
                                notificationTitleModel[i].tvTitle,
                                style: TextStyle(
                                  fontFamily: sf_pro_display_bold,
                                  color: black_273433,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),

                            /*--------- ListData Recyclerview ---------*/
                            Container(
                              padding: EdgeInsets.only(top: 15, left: 24,right: 24),
                              child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                primary: false,
                                shrinkWrap: true,
                                itemCount: notificationListModel.length,
                                itemBuilder: (context, i) => Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 16),
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: CircularProfileAvatar(
                                            '',
                                            child: Image.asset(
                                              notificationListModel[i].imgProfile,),
                                            // borderColor: green_24d39e,
                                            // borderWidth: 1,
                                            // elevation: 2,
                                            // radius: 50,
                                          ),
                                        ),
                                        SizedBox(width: 24,),
                                        RichText(
                                          text: TextSpan(
                                              text: notificationListModel[i].tvTitle,
                                              style: TextStyle(
                                                fontSize: 12.5,
                                                color: light_black_333333,
                                                fontWeight: FontWeight.w600,
                                                fontFamily:
                                                    sf_pro_display_regular,
                                                fontStyle: FontStyle.normal,
                                              ),

                                              children: <TextSpan>[

                                                TextSpan(
                                                    text:notificationListModel[i].tvSubTitle,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: light_black_333333,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          poppins_medium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                    )),

                                                TextSpan(
                                                    text: notificationListModel[i].tvMinutes,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: grey_96a6a3,
                                                      fontFamily:
                                                          sf_pro_display_medium,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                    )),
                                              ]),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
