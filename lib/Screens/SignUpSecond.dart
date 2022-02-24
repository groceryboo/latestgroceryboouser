import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/view/emailview.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/view/phonenumberview.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';

class SignUpSecond extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpSecond> with SingleTickerProviderStateMixin{

  TabController _tabController;
  int activePageIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  var mobilenumerTextController = TextEditingController();
  var emialTextController = TextEditingController();

  static const _kBasePadding = 17.0;
  static const kExpandedHeight = 150.0;

  final ValueNotifier<double> _titlePaddingNotifier = ValueNotifier(_kBasePadding);

  final _scrollController = ScrollController();

  double get _horizontalTitlePadding {
    const kCollapsedPadding = 80.0;

    if (_scrollController.hasClients) {
      return min(_kBasePadding + kCollapsedPadding,
          _kBasePadding + (kCollapsedPadding * _scrollController.offset)/(kExpandedHeight - kToolbarHeight));
    }

    return _kBasePadding;
  }

  @override
  Widget build(BuildContext context) {

    _scrollController.addListener(() {
      _titlePaddingNotifier.value = _horizontalTitlePadding;
    });

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:  Colors.white, // navigation bar color
      statusBarColor:  Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.light, //navigation bar icons' color
    ));

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
         // appBar: toolbar(context, ""),
          body: NestedScrollView(
            controller: _scrollController,
            physics:  ScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    toolbarHeight: 80,
                    title: Padding(
                      padding:  EdgeInsets.only(left: 10),
                      child: BackLayout(),
                    ),
                    forceElevated: innerBoxIsScrolled,
                    expandedHeight: kExpandedHeight,
                    floating: false,
                    pinned: true,
                    stretch: false,
                    shadowColor: grey_e9ecec.withOpacity(0.3),

                    flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        centerTitle: false,

                        titlePadding: EdgeInsets.symmetric(vertical: 26, horizontal: 0),
                        title: ValueListenableBuilder(
                          valueListenable: _titlePaddingNotifier,
                          builder: (context, value, child) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: double.parse(value.toString())),
                              child:
                              // Sign up
                              Text(
                                  signup,
                                  style:  TextStyle(
                                      color:  black,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: sf_pro_display_bold,
                                      fontStyle:  FontStyle.normal,
                                      fontSize: HeightData.sixteen
                                  ),
                                  textAlign: TextAlign.left
                              ),

                            );
                          },
                        ),
                        background: Container(color: Colors.white)
                    )
                ),
              ];
            },
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Padding(
                  padding:  EdgeInsets.only(left: 24,right: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // BackLayout(),
                      //
                      // SizedBox(height: 32,),
                      // // Sign up
                      // Text(
                      //     signup,
                      //     style:  TextStyle(
                      //         color:  black,
                      //         fontWeight: FontWeight.w700,
                      //         fontFamily: boldPoppinsFont,
                      //         fontStyle:  FontStyle.normal,
                      //         fontSize: 24.0
                      //     ),
                      //     textAlign: TextAlign.left
                      // ),


                      // give the tab bar a height [can change hheight to preferred height]
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: grey_e9ecec,
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                            // boxShadow: [BoxShadow(
                            //     color:  Color(0xffe8e8e8),
                            //     offset: Offset(0,5),
                            //     blurRadius: 10,
                            //     spreadRadius: 2
                            // )] ,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TabBar(
                              controller: _tabController,
                              // give the indicator a decoration (color and border radius)
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  6.0,
                                ),
                                color: Colors.white,
                              ),
                              labelColor: black,
                              unselectedLabelColor: grey_96a6a3,
                              tabs: [
                                // first tab [you can add an icon using the icon property]
                                Tab(
                                  child: Text("Phone number",
                                    style: TextStyle(fontFamily: sf_pro_display_bold,fontSize: 12),),
                                ),

                                // second tab [you can add an icon using the icon property]
                                Tab(
                                  child: Text("Email",style: TextStyle(fontFamily: sf_pro_display_bold,fontSize: 12),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                // tab bar view here
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // first tab bar view widget
                      new Container(
                        child: MobileNumber(),
                      ),

                      // second tab bar view widget
                      new Container(
                        child: Email(),
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
