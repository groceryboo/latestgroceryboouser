// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:groceryboouser/Screens/SignUp/view/phonenumberview.dart';
// import 'package:groceryboouser/Screens/SignUp/view/emailview.dart';
// import 'package:groceryboouser/Styles/my_colors.dart';
// import 'package:groceryboouser/Styles/my_height.dart';
// import 'package:groceryboouser/Styles/my_icons.dart';
// import 'package:groceryboouser/Styles/my_strings.dart';
// import 'package:groceryboouser/Utilities/Constant.dart';
//
// class SignUp extends StatefulWidget {
//   @override
//   _SignUpState createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin{
//
//   TabController? _tabController;
//   int activePageIndex = 0;
//
//   @override
//   void initState() {
//     _tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _tabController?.dispose();
//   }
//
//   var mobilenumerTextController = TextEditingController();
//   var emialTextController = TextEditingController();
//
//   static const _kBasePadding = 17.0;
//   static const kExpandedHeight = 150.0;
//
//   final ValueNotifier<double> _titlePaddingNotifier = ValueNotifier(_kBasePadding);
//
//   final _scrollController = ScrollController();
//
//   double get _horizontalTitlePadding {
//     const kCollapsedPadding = 80.0;
//
//     if (_scrollController.hasClients) {
//       return min(_kBasePadding + kCollapsedPadding,
//           _kBasePadding + (kCollapsedPadding * _scrollController.offset)/(kExpandedHeight - kToolbarHeight));
//     }
//
//     return _kBasePadding;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _scrollController.addListener(() {
//       _titlePaddingNotifier.value = _horizontalTitlePadding;
//     });
//
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       systemNavigationBarColor:  Colors.white, // navigation bar color
//       statusBarColor:  Colors.white, // status bar color
//       statusBarIconBrightness: Brightness.dark, // status bar icons' color
//       systemNavigationBarIconBrightness:
//       Brightness.light, //navigation bar icons' color
//     ));
//
//     return SafeArea(
//         child: ScreenUtilInit(
//           designSize: Size(360, 690),
//           builder: () => Scaffold(
//             resizeToAvoidBottomInset: false,
//             backgroundColor: Colors.white,
//             // appBar: toolbar(context, ""),
//             body: NestedScrollView(
//               controller: _scrollController,
//               physics:  ScrollPhysics(),
//               headerSliverBuilder: (context, innerBoxIsScrolled) {
//                 return <Widget>[
//                   SliverAppBar(
//                       // actions: [
//                       //   Padding(
//                       //     padding: const EdgeInsets.only(top: 25, right: 20),
//                       //     child: Text(
//                       //       "SIGN IN",
//                       //       style: const TextStyle(
//                       //           color: const Color(0xff3c4856),
//                       //           fontWeight: FontWeight.w400,
//                       //           fontFamily: sf_pro_display_bold,
//                       //           fontStyle: FontStyle.normal,
//                       //           fontSize: 15.0),
//                       //     ),
//                       //   )
//                       // ],
//                       automaticallyImplyLeading: false,
//                       backgroundColor: Colors.white,
//                       toolbarHeight: 80.h,
//                       title: Padding(
//                         padding:  EdgeInsets.only(left: 10.w),
//                          child :  Container(
//                             child:  GestureDetector(
//                               onTap: (){
//                                 Get.back();
//                                 // Navigator.pop(context);
//                               },
//                               child: Container(
//                                 width: 46.w,
//                                 height: 46.h,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(10),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.1),
//                                       spreadRadius: 6,
//                                       blurRadius: 10,
//                                       offset: Offset(1, 4), // changes position of shadow
//                                     ),
//                                   ],
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12.0),
//                                   child: SvgPicture.asset(BackArrow,width: 24.w,height: 24.h,),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       forceElevated: innerBoxIsScrolled,
//                       expandedHeight: kExpandedHeight,
//                       floating: false,
//                       pinned: true,
//                       stretch: false,
//                       shadowColor: grey_e9ecec.withOpacity(0.3),
//
//                       flexibleSpace: FlexibleSpaceBar(
//                           collapseMode: CollapseMode.pin,
//                           centerTitle: false,
//
//                           titlePadding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 0),
//                           title: ValueListenableBuilder(
//                             valueListenable: _titlePaddingNotifier,
//                             builder: (context, value, child) {
//                               return Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: double.parse(value.toString())),
//                                 child:
//                                 // Sign up
//                                 Text(
//                                     signup,
//                                     style:  TextStyle(
//                                         color:  black,
//                                         fontWeight: FontWeight.w700,
//                                         fontFamily: sf_pro_display_bold,
//                                         fontStyle:  FontStyle.normal,
//                                         fontSize: HeightData.sixteen
//                                     ),
//                                     textAlign: TextAlign.left
//                                 ),
//
//                               );
//                             },
//                           ),
//                           background: Container(color: Colors.white)
//                       )
//                   ),
//                 ];
//               },
//               body: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding:  EdgeInsets.only(left: 24.w,right: 24.w),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // give the tab bar a height [can change height to preferred height]
//                         Padding(
//                           padding:  EdgeInsets.only(bottom: 32.h),
//                           child: Container(
//                             height: 60.h,
//                             decoration: BoxDecoration(
//                               color: grey_e9ecec,
//                               borderRadius: BorderRadius.circular(
//                                 8.0,
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: TabBar(
//                                 controller: _tabController,
//                                 // give the indicator a decoration (color and border radius)
//                                 indicator: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(
//                                     6.0,
//                                   ),
//                                   color: Colors.white,
//                                 ),
//                                 labelColor: black,
//                                 unselectedLabelColor: grey_96a6a3,
//                                 tabs: [
//                                   // first tab [you can add an icon using the icon property]
//                                   Tab(
//                                     child: Text("Phone number",
//                                       style: TextStyle(fontFamily: sf_pro_display_semibold,fontSize: 14),),
//                                   ),
//
//                                   // second tab [you can add an icon using the icon property]
//                                   Tab(
//                                     child: Text("Email",style: TextStyle(fontFamily: sf_pro_display_semibold,fontSize: 14),),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//
//                   // tab bar view here
//                   Expanded(
//                     child: TabBarView(
//                       controller: _tabController,
//                       children: [
//                         // first tab bar view widget
//                         new Container(
//                           child: MobileNumber(),
//                         ),
//
//                         // second tab bar view widget
//                         new Container(
//                           child: Email(),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
