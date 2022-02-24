// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:groceryboouser/Utilities/TextUtilities.dart';
// import 'package:groceryboouser/Utils/text_utilities.dart';
// import '../../../../Layouts/ToolbarWithHeaderAction.dart';
// import '../../../../Layouts/WalletTransactionItemWidget.dart';
// import '../../../../Styles/my_colors.dart';
// import '../../../../Styles/my_strings.dart';
// import '../../../../Utils/SizeConfig.dart';
// import '../../../../Styles/my_colors.dart';
// import '../../../../Styles/my_colors.dart';
// import '../../../../Styles/my_height.dart';
// import '../../../../Styles/my_icons.dart';
// import '../../../../Utilities/Constant.dart';
// import '../../../../Utils/SizeConfig.dart';
// import '../../withdraw/model/TransactionModel.dart';
//
// class TransactionHistory extends StatefulWidget {
//   const TransactionHistory({Key key}) : super(key: key);
//
//   @override
//   _TransactionHistoryState createState() => _TransactionHistoryState();
// }
//
// class _TransactionHistoryState extends State<TransactionHistory> {
//   List<TransactionModel> _transactionListData = [
//     TransactionModel("\$50", skygreen_24d39e, top_up, wallet,
//         groceryboo_single_line, dummy_date),
//     TransactionModel("\$150", red_FA586A, "Order", "Store name",
//         groceryboo_single_line, dummy_date),
//     TransactionModel("\$40", skygreen_24d39e, "Pin Commision", "Pin Name",
//         groceryboo_single_line, dummy_date),
//     TransactionModel("\$50", skygreen_24d39e, top_up, wallet,
//         groceryboo_single_line, dummy_date),
//     TransactionModel("\$150", red_FA586A, "Order", "Store name",
//         groceryboo_single_line, dummy_date),
//     TransactionModel("\$40", skygreen_24d39e, "Pin Commision", "Pin Name",
//         groceryboo_single_line, dummy_date)
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//         body: SafeArea(
//       child: Column(
//         children: [
//           Container(
//               margin: EdgeInsets.fromLTRB(
//                   SizeConfig.screenWidth * 0.05,
//                   0,
//                   SizeConfig.screenWidth * 0.05,
//                   SizeConfig.screenHeight * 0.025),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   ToolbarWithHeaderAction(transaction_history, filter_item_icon,
//                       () {
//                     _openBottomSheet(context);
//                   }),
//                   SizedBox(
//                     height: SizeConfig.screenHeight * 0.025,
//                   ),
//                   GestureDetector(
//                       onTap: () {
//                         _openBottomSheet(context);
//                       },
//                       child: Row(
//                         children: [
//                           SvgPicture.asset(
//                             calendar_icon,
//                             height: 13,
//                             width: 13,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           setRegulerText("Sep 29 2021 - Sep 31 2021", 12,
//                               Colors.black, FontWeight.w500, FontStyle.normal),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           Icon(
//                             Icons.keyboard_arrow_down,
//                             color: grey_96a6a3,
//                           ),
//                         ],
//                       )),
//                 ],
//               )),
//           Expanded(
//               child: ListView.builder(
//                   padding: EdgeInsets.fromLTRB(
//                       SizeConfig.screenWidth * 0.05,
//                       0,
//                       SizeConfig.screenWidth * 0.05,
//                       SizeConfig.screenHeight * 0.025),
//                   itemCount: _transactionListData.length,
//                   itemBuilder: ((context, index) {
//                     return _listviewItem(context, index);
//                   })))
//         ],
//       ),
//     ));
//   }
//
//   Widget _listviewItem(context, index) {
//     return WalletTransactionItemWidget(
//       transactionModel: _transactionListData[index],
//     );
//   }
//
//   _openBottomSheet(context) {
//     showModalBottomSheet<void>(
//         context: context,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         builder: (BuildContext context) {
//           return Container(
//             height: SizeConfig.screenHeight / 2,
//             padding: EdgeInsets.symmetric(
//                 horizontal: SizeConfig.screenWidth * 0.05,
//                 vertical: SizeConfig.screenHeight * 0.025),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       width: 50,
//                       height: 3,
//                       color: grey_96a6a3,
//                     )),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Align(
//                     alignment: Alignment.center,
//                     child: setSemiBoldPoppinsText(filter_transaction_history,
//                         14.0, Colors.black, FontWeight.w700, FontStyle.normal)),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 setSemiBoldSFProText(date_filter, 16.0, Colors.black,
//                     FontWeight.w600, FontStyle.normal),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                         child: GestureDetector(
//                             child: Card(
//                                 color: Colors.grey[300],
//                                 child: Padding(
//                                     padding: EdgeInsets.all(10),
//                                     child: Row(
//                                       children: [
//                                         SvgPicture.asset(
//                                           calendar_circle,
//                                           height: 32,
//                                           width: 32,
//                                         ),
//                                         SizedBox(
//                                           width: 5,
//                                         ),
//                                         Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               setMediumSFProText(
//                                                   from_text,
//                                                   11,
//                                                   grey_96a6a3,
//                                                   FontWeight.w500,
//                                                   FontStyle.normal),
//                                               SizedBox(
//                                                 height: 8,
//                                               ),
//                                               setRegulerText(
//                                                   "29 Sep 2021",
//                                                   14,
//                                                   Colors.black,
//                                                   FontWeight.w700,
//                                                   FontStyle.normal),
//                                             ]),
//                                       ],
//                                     ))))),
//                     Expanded(
//                         child: GestureDetector(
//                             child: Card(
//                                 color: Colors.grey[300],
//                                 child: Padding(
//                                     padding: EdgeInsets.all(10),
//                                     child: Row(
//                                       children: [
//                                         SvgPicture.asset(
//                                           calendar_circle,
//                                           height: 32,
//                                           width: 32,
//                                         ),
//                                         SizedBox(
//                                           width: 5,
//                                         ),
//                                         Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               setMediumSFProText(
//                                                   to_text,
//                                                   11,
//                                                   grey_96a6a3,
//                                                   FontWeight.w500,
//                                                   FontStyle.normal),
//                                               SizedBox(
//                                                 height: 8,
//                                               ),
//                                               setRegulerText(
//                                                   "30 Sep 2021",
//                                                   14,
//                                                   Colors.black,
//                                                   FontWeight.w700,
//                                                   FontStyle.normal),
//                                             ]),
//                                       ],
//                                     ))))),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(boxShadow: [
//                     BoxShadow(
//                       color: Color(0x17747796).withOpacity(0.07),
//                       spreadRadius: 10,
//                       blurRadius: 10,
//                       offset: Offset(0, 20), // changes position of shadow
//                     ),
//                   ]),
//                   child: SizedBox(
//                     width: double.infinity,
//                     height: HeightData.sixty,
//                     child: ElevatedButton(
//                         child: //
//                             Text("Search Filter",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w700,
//                                     fontFamily: sf_pro_display_bold,
//                                     fontStyle: FontStyle.normal,
//                                     fontSize: 16.0),
//                                 textAlign: TextAlign.left),
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           primary: skygreen_24d39e,
//                           onPrimary: Colors.white,
//                           elevation: 0,
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 0, vertical: 21),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             side: BorderSide(color: skygreen_24d39e, width: 0),
//                           ),
//                         )),
//                   ),
//                 )
//               ],
//             ),
//           );
//         });
//   }
// }
