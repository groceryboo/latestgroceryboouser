// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:groceryboouser/Screens/PaymentFlow/Topup/view/TopupSuccessPage.dart';
// import 'package:groceryboouser/Styles/my_colors.dart';
// import 'package:groceryboouser/Styles/my_height.dart';
// import 'package:groceryboouser/Utils/text_utilities.dart';
//
// import '../../../../Layouts/ElevatedGreenButton.dart';
// import '../../../../Layouts/ToolbarWithHeader.dart';
// import '../../../../Styles/my_strings.dart';
// import '../../../../Utilities/Constant.dart';
// import '../../../../Utils/SizeConfig.dart';
// import '../../../../Utils/internet_connection.dart';
// import '../../../Authentication/SignUp/controller/signupcontroller.dart';
// import '../controller/TopUpWalletController.dart';
// import 'TopupFailedPage.dart';
//
// class TopUpWalletPage extends StatefulWidget {
//   const TopUpWalletPage({Key key}) : super(key: key);
//
//   @override
//   _TopUpWalletPageState createState() => _TopUpWalletPageState();
// }
//
// class _TopUpWalletPageState extends State<TopUpWalletPage> {
//   TopupWalletController controller = Get.put(TopupWalletController());
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//
//     return Scaffold(
//         body: SafeArea(
//       child: Container(
//           width: double.infinity,
//           margin: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.05, 0,
//               SizeConfig.screenWidth * 0.05, SizeConfig.screenHeight * 0.025),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ToolbarWithHeader(top_up_wallet, false),
//                         SizedBox(height: SizeConfig.screenHeight * 0.025),
//                         // Current Amount Lable
//                         setRegulerText(current_balance, 16.0, black,
//                             FontWeight.w600, FontStyle.normal),
//                         SizedBox(
//                           height: 3,
//                         ),
//                         // Current Amount Widget
//                         setRegulerText("\$147.00", 32.0, black, FontWeight.w700,
//                             FontStyle.normal),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         // Top up Wallet Lable
//                         setRegulerText(topup_wallet, 16.0, black,
//                             FontWeight.w600, FontStyle.normal),
//
//                         SizedBox(
//                           height: 11,
//                         ),
//                         Container(
//                             height: HeightData.fifty_six,
//                             decoration: BoxDecoration(
//                               color: grey_e9ecec,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             // padding: EdgeInsets.all(20),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                     child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 10, right: 10),
//                                         child: TextField(
//                                           controller:
//                                               controller.amountText.value,
//                                           keyboardType: TextInputType.number,
//                                           decoration: InputDecoration(
//                                               contentPadding:
//                                                   EdgeInsets.all(10),
//                                               hintText: enter_amount,
//                                               border: InputBorder.none,
//                                               hintStyle: TextStyle(
//                                                   fontFamily:
//                                                       sf_pro_display_bold,
//                                                   fontSize: 14.0,
//                                                   fontWeight: FontWeight.w700,
//                                                   color: grey_96a6a3)),
//                                         ))),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 Container(
//                                   width: 50,
//                                   height: double.infinity,
//                                   decoration: BoxDecoration(
//                                     color: grey_A0B0AD,
//                                     borderRadius: BorderRadius.only(
//                                       topRight: Radius.circular(8),
//                                       bottomRight: Radius.circular(8),
//                                     ),
//                                   ),
//                                   child: Center(
//                                       child: setRegulerText(
//                                           doller_symbol,
//                                           18.0,
//                                           grey_e9ecec,
//                                           FontWeight.w700,
//                                           FontStyle.normal)),
//                                 )
//                               ],
//                             )),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 CommonElevatedButton("Continue", Colors.white, skygreen_24d39e,
//                     () {
//                   print("Continue Clicked");
//                   FocusManager.instance.primaryFocus?.unfocus();
//
//                   if (controller.amountText.value.text.isNotEmpty) {
//                     checkNet(context).then((value) async {
//                       print(controller.amountText.value.text);
//
//                       controller.chargeCardAndMakePayment(context);
//
//                       // controller.callTopupApi(context);
//                     });
//                   } else {
//                     snackBar(context, enter_Amount_first);
//                   }
//                 })
//               ])),
//     ));
//   }
// }
