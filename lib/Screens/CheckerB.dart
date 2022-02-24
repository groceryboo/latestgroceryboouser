// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
// import 'package:groceryboouser/Layouts/ToolbarWithHeader.dart';
// import 'package:groceryboouser/Screens/CheckerC.dart';
// import 'package:groceryboouser/Screens/Location/controller/AddressController.dart';
// import 'package:groceryboouser/Styles/my_colors.dart';
// import 'package:groceryboouser/Styles/my_strings.dart';
// import 'package:groceryboouser/Utils/internet_connection.dart';
//
//
// class CheckO extends StatefulWidget {
//   @override
//   _CheckOState createState() => _CheckOState();
// }
//
// class _CheckOState extends State<CheckO> {
//   AddressController controller = Get.put(AddressController());
//   final formKey = GlobalKey<FormState>();
//
//   // final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       systemNavigationBarColor: Colors.white, // navigation bar color
//       statusBarColor: Colors.white, // status bar color
//       statusBarIconBrightness: Brightness.dark, // status bar icons' color
//       systemNavigationBarIconBrightness:
//           Brightness.light, //navigation bar icons' color
//     ));
//
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.white,
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(100),
//           child: Obx(
//             () => ToolbarWithHeader(
//                 controller.title, controller.boolDisplayEditLayout.value),
//           ),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               flex: 1,
//               child: SingleChildScrollView(
//                 child: Obx(
//                   () => Form(
//                     key: formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 24, top: 16, bottom: 34, right: 24),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 26,
//                               ),
//                               setFormTextField(
//                                 controller.deliveryInstText.value,
//                                 "Enter your name",
//                                 false,
//                                 TextInputType.text,
//                                 TextInputAction.done,
//                                 (value) => {
//                                   setState(() {}),
//                                   print("  "),
//                                 },
//                                 validator: (value) {
//                                   if (value != "")
//                                     return null;
//                                   else
//                                     return 'Please Enter First Name';
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             CommonElevatedButton(saved_address, Colors.white, skygreen_24d39e,
//                 () {
//               FocusScope.of(context).unfocus();
//               checkNet(context).then((value) {
//                 // if(controller.firstNameText.value.text.isEmpty){
//                 //   snackBarRapid(context, "Add First Name");
//                 //   return;
//                 // }if(controller.lastNameText.value.text.isEmpty){
//                 //   snackBarRapid(context, "Add Last Name");
//                 //   return;
//                 // }if(controller.savedNameAsText.value.text.isEmpty){
//                 //   snackBarRapid(context, "Add saved name");
//                 //   return;
//                 // }if(controller.landmarkText.value.text.isEmpty){
//                 //   snackBarRapid(context, "Add Landmark");
//                 //   return;
//                 // }if(controller.streetNameText.value.text.isEmpty){
//                 //   snackBarRapid(context, "Add Streetname");
//                 //   return;
//                 // }if(controller.streetName2Text.value.text.isEmpty){
//                 //   snackBarRapid(context, "Add Streetname 2");
//                 //   return;
//                 // }
//                 // if(validateMobile(controller.phoneNumText.value.text) != null){
//                 //   snackBarRapid(context,validateMobile(controller.phoneNumText.value.text));
//                 //   return;
//                 // }
//                 // if(controller.deliveryInstText.value.text.isEmpty){
//                 //   snackBarRapid(context, "Add Delivery instruction");
//                 //   return;
//                 // }
//
//                 if (formKey.currentState.validate()) {
//                   if (controller.boolDisplayEditLayout.value == true) {
//                     controller.createAddressAPI(context);
//                   } else {
//                     controller.editAddressAPI(context);
//                   }
//                 } else {
//                   print("else");
//                 }
//               });
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
