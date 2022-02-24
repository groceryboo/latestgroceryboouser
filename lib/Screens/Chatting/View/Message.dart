import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryboouser/Model/MessageModel.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';

class Message extends StatefulWidget {
  const Message({Key key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  List<MessageModel> messageListModel = [
    MessageModel("assets/images/girl.png", "Elstonbrown", "pinned your post.",
        "15m", "5"),
    MessageModel("assets/images/girl.png", "Elstonbrown",
        "pinned your Follers.", "15m", "4"),
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
                    setBoldSFProText(mesagge, 18, black_273433, FontWeight.w700,
                        FontStyle.normal),
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
              SizedBox(
                height: 32,
              ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                 itemCount: messageListModel.length,
                itemBuilder: (context, i) => Container(
                    margin: EdgeInsets.only(bottom: 16, left: 24, right: 24),
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 55,
                          height: 55,
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
                            height: 49,
                            width: 49,
                            child: CircularProfileAvatar(
                              '',
                              child:
                                  Image.asset(messageListModel[i].imgProfile),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                messageListModel[i].tvUserName,
                                style: TextStyle(
                                  fontFamily: sf_pro_display_medium,
                                  fontSize: 14,
                                  color: black_273433,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                messageListModel[i].tvMessage,
                                style: TextStyle(
                                  fontFamily: sf_pro_display_medium,
                                  fontSize: 12,
                                  color: grey_96a6a3,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ],
                          ),
                          flex: 1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              messageListModel[i].tvMinutes,
                              style: TextStyle(
                                fontFamily: sf_pro_display_medium,
                                fontSize: 11,
                                color: grey_96a6a3,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              height: 21,
                              width: 21,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: skygreen_24d39e,
                                // borderRadius: BorderRadius.circular(
                                //   25.0,
                                // ),
                              ),
                              child: Center(
                                child: Text(
                                  messageListModel[i].tvNoMessage,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: sf_pro_display_bold,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
