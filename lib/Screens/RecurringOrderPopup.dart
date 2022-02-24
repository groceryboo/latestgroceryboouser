// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:groceryboouser/Styles/my_colors.dart';
// import 'package:groceryboouser/Utilities/Constant.dart';
//
// import 'EveryDayTab.dart';
//
// class RecurringOrderPopup extends StatefulWidget {
//
//   @override
//   _RecurringOrderPopupState createState() => _RecurringOrderPopupState();
// }
//
// class _RecurringOrderPopupState extends State<RecurringOrderPopup> with SingleTickerProviderStateMixin {
//    TabController _tabController;
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
//     _tabController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       systemNavigationBarColor: Colors.white, // navigation bar color
//       statusBarColor: Colors.white, // status bar color
//       statusBarIconBrightness: Brightness.dark, // status bar icons' color
//       systemNavigationBarIconBrightness:
//       Brightness.light, //navigation bar icons' color
//     ));
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Scaffold(
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//
//
//               Container(
//                 margin: EdgeInsets.only(left: 24, right: 24, top: 15),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 60,
//                   child: ElevatedButton(
//                       child: Text(
//                         "Checkout",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontFamily: sf_pro_display_bold),
//                       ),
//                       onPressed: () {
//                         bottomSheet(context);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: skygreen_24d39e,
//                         onPrimary: Colors.white,
//                         elevation: 0,
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 0, vertical: 21),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           side: BorderSide(color: skygreen_24d39e, width: 0),
//                         ),
//                       )),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   void bottomSheet(BuildContext context) {
//     showModalBottomSheet(
//         isScrollControlled: false,
//         backgroundColor: Colors.transparent,
//         context: context,
//         builder: (context) {
//           return DraggableScrollableSheet(
//               initialChildSize: 0.95,
//               maxChildSize: 1,
//               minChildSize: 0.1,
//               builder:
//                   (BuildContext context, ScrollController scrollController) {
//                 return Container(
//                     decoration: new BoxDecoration(
//                       //   color: forDialog ? Color(0xFF737373) : Colors.white,
//                         color: Colors.white,
//                         borderRadius: new BorderRadius.only(
//                             topLeft: const Radius.circular(30.0),
//                             topRight: const Radius.circular(30.0))),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Center(
//                           child: Container(
//                             margin: EdgeInsets.only(top: 12),
//                             height: 4,
//                             width: 48,
//                             decoration: BoxDecoration(
//                                 color: grey_96a6a3,
//                                 borderRadius: new BorderRadius.circular(4)),
//                           ),
//                         ),
//
//                         SizedBox(height: 28,),
//                         Center(
//                           child: Text(
//                             "Set recurring order",
//                             style: TextStyle(
//                                 color: black_273433,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w700,
//                                 fontStyle:  FontStyle.normal,
//                                 fontFamily: sf_pro_display_bold),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 28,
//                         ),
//                         Divider(
//                           color: silver_f4f6f6,
//                           thickness: 1,
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 24.0),
//                               child: Text(
//                                 "Repeat on",
//                                 style: TextStyle(
//                                     color: black_273433,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w700,
//                                     fontStyle:  FontStyle.normal,
//                                     fontFamily: sf_pro_display_bold),
//                               ),
//                             ),
//
//                             /*------- Tablayout code here --------*/
//                             Expanded(
//                               flex: 1,
//                               child: Container(
//                                 margin: EdgeInsets.only(left: 70,right: 24),
//                                 height: 46,
//                                 decoration: BoxDecoration(
//                                   color: grey_e9ecec,
//                                   borderRadius: BorderRadius.circular(
//                                     8.0,
//                                   ),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: TabBar(
//                                     controller: _tabController,
//                                     // give the indicator a decoration (color and border radius)
//                                     indicator: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(
//                                         8.0,
//                                       ),
//                                       color: Colors.white,
//                                     ),
//                                     labelColor: black_273433,
//                                     unselectedLabelColor: grey_96a6a3,
//                                     tabs: [
//
//                                       // First tab
//                                       Tab(
//                                         child: Column(
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           crossAxisAlignment: CrossAxisAlignment.center,
//                                           children: [
//                                             Text("Every Day",
//                                               style: TextStyle(
//                                                 fontSize: 12,
//                                                 fontFamily: sf_pro_display_medium,
//                                                 fontWeight: FontWeight.w500,
//                                                 fontStyle: FontStyle.normal,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//
//
//                                       ),
//                                       // Second tab
//                                       Tab(
//                                         child: Column(
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           crossAxisAlignment: CrossAxisAlignment.center,
//                                           children: [
//                                             Text("Every Month",
//                                               style: TextStyle(
//                                                 fontSize: 12,
//                                                 fontFamily: sf_pro_display_medium,
//                                                 fontWeight: FontWeight.w500,
//                                                 fontStyle: FontStyle.normal,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//
//
//                                       ),
//
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 9,
//                         ),
//                         Divider(
//                           color: silver_f4f6f6,
//                           thickness: 1,
//                         ),
//
//                         /*------ viewpager code here -----------*/
//                         Expanded(
//                           child: TabBarView(
//                             physics: BouncingScrollPhysics(),
//                             controller: _tabController,
//                             children: [
//                               // first tab set in Tablayout.
//                               EveryDayTab(),
//
//                               // second tab set in Tablayout.
//                               EveryDayTab(),
//                             ],
//                           ),
//                         ),
//
//                       ],
//                     ));
//               });
//         });
//   }
//
// }
