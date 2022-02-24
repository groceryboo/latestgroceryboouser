// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:groceryboouser/Screens/PaymentFlow/TransactionHistory/view/TransactionHistory.dart';
// import 'package:groceryboouser/Screens/PaymentFlow/withdraw/model/TransactionModel.dart';
// import 'package:groceryboouser/Screens/PaymentFlow/withdraw/view/WithdrawPage.dart';
// import 'package:groceryboouser/Styles/my_strings.dart';
// import 'package:groceryboouser/Layouts/WalletTransactionItemWidget.dart';
// import '../../../Layouts/ToolbarWithHeader.dart';
// import '../../../Styles/my_colors.dart';
// import '../../../Styles/my_icons.dart';
// import '../../../Utils/SizeConfig.dart';
// import '../../../Utils/text_utilities.dart';
// import '../Topup/view/TopUpWalletPage.dart';
//
// class WalletDashboard extends StatefulWidget {
//   const WalletDashboard({Key key}) : super(key: key);
//
//   @override
//   _WalletDashboardState createState() => _WalletDashboardState();
// }
//
// class _WalletDashboardState extends State<WalletDashboard> {
//   List<TransactionModel> _transactionListData = [
//     TransactionModel("\$50", skygreen_24d39e, top_up, wallet,
//         groceryboo_single_line, dummy_date),
//     TransactionModel("\$150", red_FA586A, "Order", "Store name",
//         groceryboo_single_line, dummy_date),
//     TransactionModel("\$40", skygreen_24d39e, "Pin Commision", "Pin Name",
//         groceryboo_single_line, dummy_date)
//   ];
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
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
//                   ToolbarWithHeader(wallet, false),
//                   SizedBox(
//                     height: SizeConfig.screenHeight * 0.025,
//                   ),
//                   Container(
//                     height: 209,
//                     padding: EdgeInsets.only(
//                         top: 30, left: 32, right: 32, bottom: 30),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(8)),
//                       gradient: LinearGradient(
//                           colors: [
//                             green_15CF7D,
//                             skygreen_24d39e,
//                           ],
//                           begin: const FractionalOffset(0.0, 0.0),
//                           end: const FractionalOffset(1.0, 0.0),
//                           stops: [0.0, 1.0],
//                           tileMode: TileMode.clamp),
//                     ),
//                     child: Column(children: [
//                       Row(
//                         children: [
//                           setRegulerText("JASON STEM", 16.0, Colors.white,
//                               FontWeight.w700, FontStyle.normal),
//                           Spacer(),
//                           setRegulerText(
//                               groceryboo_single_line,
//                               14.0,
//                               Colors.white,
//                               FontWeight.normal,
//                               FontStyle.normal),
//                         ],
//                       ),
//                       Spacer(),
//                       Align(
//                           alignment: Alignment.topLeft,
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 setRegulerText(
//                                     wallet_amount,
//                                     16.0,
//                                     Colors.white,
//                                     FontWeight.w600,
//                                     FontStyle.normal),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 setRegulerText("\$147.00", 32.0, Colors.white,
//                                     FontWeight.w700, FontStyle.normal),
//                               ]))
//                     ]),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: _shadowedContainerHorizontal(
//                             top_up,
//                             Colors.white,
//                             Colors.black,
//                             plus_rounded_icon,
//                             Colors.black,
//                             16.67,
//                             19.67,
//                             19.67, () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: ((context) => TopUpWalletPage())));
//                         }),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: _shadowedContainerHorizontal(
//                             withdraw,
//                             Colors.white,
//                             Colors.black,
//                             withdraw_icon,
//                             Colors.black,
//                             16.67,
//                             19.67,
//                             19.67, () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: ((context) => WithdrawPage())));
//                         }),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                           child: GestureDetector(
//                               child: _shadowedContainerVertical(
//                                   pin_revenue,
//                                   "\$1,500",
//                                   Colors.white,
//                                   Colors.black,
//                                   19.67,
//                                   19.67,
//                                   () {}))),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                           child: GestureDetector(
//                               child: _shadowedContainerVertical(
//                                   ads_revenue,
//                                   "\$100",
//                                   Colors.white,
//                                   Colors.black,
//                                   16.0,
//                                   16.0,
//                                   () {})))
//                     ],
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Row(
//                     children: [
//                       setRegulerText(transaction_history, 18, Colors.black,
//                           FontWeight.w700, FontStyle.normal),
//                       Spacer(),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => TransactionHistory()));
//                         },
//                         child: setRegulerText(see_all, 14.0, grey_96a6a3,
//                             FontWeight.w500, FontStyle.normal),
//                       )
//                     ],
//                   ),
//                   // SizedBox(
//                   //   height: 15,
//                   // ),
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
//       )),
//     );
//   }
//
//   Widget _listviewItem(context, index) {
//     return
//     WalletTransactionItemWidget(transactionModel: _transactionListData[index],);
//
//   }
//
//   Widget _shadowedContainerHorizontal(
//       inputText,
//       backgroundColor,
//       textColor,
//       iconValue,
//       iconColor,
//       iconSize,
//       horizontalPadding,
//       verticalPadding,
//       onCustomButtonPressed) {
//     return GestureDetector(
//         onTap: onCustomButtonPressed,
//         child: Container(
//           padding: EdgeInsets.fromLTRB(horizontalPadding, verticalPadding,
//               horizontalPadding, verticalPadding),
//           decoration: BoxDecoration(
//             color: backgroundColor,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(8),
//                 topRight: Radius.circular(8),
//                 bottomLeft: Radius.circular(8),
//                 bottomRight: Radius.circular(8)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 2,
//                 blurRadius: 20,
//                 offset: Offset(0, 7), // changes position of shadow
//               ),
//             ],
//           ),
//           child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             SvgPicture.asset(
//               iconValue,
//               height: iconSize,
//               width: iconSize,
//               alignment: Alignment.center,
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             setRegulerText(inputText, 16.0, Colors.black, FontWeight.normal,
//                 FontStyle.normal)
//           ]),
//         ));
//   }
//
//   Widget _shadowedContainerVertical(titleText, textValue, backgroundColor,
//       textColor, horizontalPadding, verticalPadding, onCustomButtonPressed) {
//     return GestureDetector(
//         onTap: onCustomButtonPressed,
//         child: Container(
//           padding: EdgeInsets.fromLTRB(horizontalPadding, verticalPadding,
//               horizontalPadding, verticalPadding),
//           decoration: BoxDecoration(
//             color: backgroundColor,
//             borderRadius: BorderRadius.all(Radius.circular(8)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 2,
//                 blurRadius: 20,
//                 offset: Offset(0, 5), // changes position of shadow
//               ),
//             ],
//           ),
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//             setRegulerText(titleText, 14.0, Colors.black, FontWeight.w400,
//                 FontStyle.normal),
//             SizedBox(
//               height: 10,
//             ),
//             setRegulerText(textValue, 16.0, Colors.black, FontWeight.w700,
//                 FontStyle.normal),
//           ]),
//         ));
//   }
// }
