// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:groceryboouser/Styles/my_colors.dart';
//
// import '../Utilities/Constant.dart';
// import 'Location/controller/AddressController.dart';
//
// bool checkColor = false;
// bool checkFillColor = true;
// bool numKeypad = false;
//
// class InputTextLayout extends StatefulWidget {
//
//   final String hintData;
//   TextEditingController inputData;
//   bool numKeypad = false;
//   String Function(String) validator;
//
//   InputTextLayout(this.hintData,this.inputData,this.numKeypad,{Function validator});
//
//   @override
//   _TextInputState createState() => _TextInputState(hintData,inputData,numKeypad);
//
//   setFormTextField(
//       TextEditingController controller,
//       String hintText,
//       bool secureEntry,
//       TextInputType inputType,
//       TextInputAction textInputAction,
//       Function onchange,
//       {Function validator}){
//
//   }
//
// }
//
// class _TextInputState extends State<InputTextLayout> {
//
//   AddressController controller = Get.put(AddressController());
//   bool checkColor = false;
//   bool checkFillColor = true;
//   String Function(String p1) validator;
//
//   String hint = " ";
//   TextEditingController inputData ;
//   bool numKeypad = false;
//
//   _TextInputState(String hintData,TextEditingController inputData,bool numKeypad){
//     this.hint = hintData;
//     this.inputData = inputData;
//     this.numKeypad = numKeypad;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//         data: new ThemeData(
//           primaryColor: Colors.green,
//           primaryColorDark: Colors.red,
//         ),
//         child: TextFormField(
//           keyboardType: numKeypad==false ? TextInputType.text : TextInputType.number ,
//           inputFormatters: [
//             numKeypad== true ? FilteringTextInputFormatter.digitsOnly : FilteringTextInputFormatter.singleLineFormatter ,
//             numKeypad== true ? LengthLimitingTextInputFormatter(10) : LengthLimitingTextInputFormatter(200),
//           ],
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           validator: (value) => validator(value),
//           style: TextStyle(
//             color: Colors.white,
//             fontStyle: FontStyle.normal,
//             fontSize: 17.28,
//           ),
//           decoration: new InputDecoration(
//             labelText: "hint",
//             labelStyle: TextStyle(color: Colors.grey,fontSize: 14),
//             hintStyle: TextStyle(
//                 color: black, fontFamily: sf_pro_display_semibold,fontSize: 14),
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: grey_e9ecec),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             filled: true,
//             fillColor: checkFillColor == false
//                 ? checkColor == true
//                 ? Colors.white
//                 : grey_e9ecec
//                 : gray_f5f8f8,
//           ),
//           textInputAction: TextInputAction.next,
//           // controller: inputData,
//           onChanged: (inputValue) {
//             if (inputValue.isNotEmpty) {
//               setState(() {
//                 checkFillColor = false;
//                 checkColor = true;
//               });
//             }
//             else {
//               setState(() {
//                 checkFillColor = true;
//               });
//             }
//           },
//           onFieldSubmitted : (String value) {
//             if(value.isNotEmpty){
//               setState(() {
//                 checkFillColor = false;
//                 checkColor = false;
//               });
//             }
//             else{
//               setState(() {
//                 checkFillColor = true;
//               });
//             }
//           },
//
//         ));
//   }
//
// }
