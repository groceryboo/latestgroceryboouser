// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:groceryboouser/Styles/my_colors.dart';
// import 'package:groceryboouser/Styles/my_icons.dart';
// import 'package:groceryboouser/Utilities/Constant.dart';
//
// class EveryDayTab extends StatefulWidget {
//
//   @override
//   _EveryDayTabState createState() => _EveryDayTabState();
// }
//
// class _EveryDayTabState extends State<EveryDayTab> {
//   final items = [
//     "Sunday",
//     "Monday",
//     "Tuesday",
//     "Wednesday",
//     "Thursday",
//     "Friday",
//     "Saturday"
//   ];
//   String value;
//   DateTime dateFrom = DateTime(2022, 01, 01);
//   DateTime dateTo = DateTime(2022, 01, 01);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
//               margin: EdgeInsets.only(left: 24, right: 24, top: 18),
//               decoration: BoxDecoration(
//                   color: rect_box,
//                   border: Border.all(color: grey_e9ecec, width: 1),
//                   borderRadius: BorderRadius.circular(8)),
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton<String>(
//                   hint: Text(
//                     "Select Days",
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: grey_96a6a3,
//                         fontFamily: sf_pro_display_medium,
//                         fontWeight: FontWeight.w500,
//                         fontStyle: FontStyle.normal),
//                   ),
//                   value: value,
//                   isExpanded: true,
//                   icon: SvgPicture.asset(
//                     arrow_spinner,
//                     height: 16,
//                     width: 16,
//                   ),
//                   items: items.map(buildMenuItem).toList(),
//                   onChanged: (value) => setState(
//                     () => this.value = value,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 21,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 6.5, horizontal: 8),
//                     margin: EdgeInsets.only(left: 24, right: 4.5),
//                     decoration: BoxDecoration(
//                         color: rect_box,
//                         border: Border.all(color: grey_e9ecec, width: 1),
//                         borderRadius: BorderRadius.circular(8)),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset(
//                           calendar_circle,
//                           height: 32,
//                           width: 32,
//                         ),
//                         SizedBox(width: 8),
//                         Expanded(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "From",
//                                 style: TextStyle(
//                                   color: grey_96a6a3,
//                                   fontWeight: FontWeight.w500,
//                                   fontStyle: FontStyle.normal,
//                                   fontFamily: sf_pro_display_regular,
//                                   fontSize: 11,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 4,
//                               ),
//                               TextField(
//                                   focusNode: AlwaysDisabledFocusNode(),
//                                   decoration: new InputDecoration(
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.symmetric(
//                                         horizontal: 0, vertical: 0),
//                                     hintText:
//                                     '${dateFrom.day}/${dateFrom.month}/${dateFrom.year}',
//                                     border: InputBorder.none,
//                                     focusedBorder: InputBorder.none,
//                                   ),
//                                   style: TextStyle(
//                                       color: black_273433,
//                                       fontFamily: sf_pro_display_medium,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w500,
//                                       fontStyle: FontStyle.normal),
//                                   onTap: () {
//                                     selectDate(context);
//                                   }),
//                             ],
//                           ),
//                           flex: 1,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 6.5, horizontal: 8),
//                     margin: EdgeInsets.only(left: 4.5, right: 24),
//                     decoration: BoxDecoration(
//                         color: rect_box,
//                         border: Border.all(color: grey_e9ecec, width: 1),
//                         borderRadius: BorderRadius.circular(8)),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset(
//                           calendar_circle,
//                           height: 32,
//                           width: 32,
//                         ),
//                         SizedBox(width: 8),
//                         Expanded(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "To",
//                                 style: TextStyle(
//                                   color: grey_96a6a3,
//                                   fontWeight: FontWeight.w500,
//                                   fontStyle: FontStyle.normal,
//                                   fontFamily: sf_pro_display_regular,
//                                   fontSize: 11,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 4,
//                               ),
//                               TextField(
//                                   focusNode: AlwaysDisabledFocusNode(),
//                                   decoration: new InputDecoration(
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.symmetric(
//                                         horizontal: 0, vertical: 0),
//                                     hintText:
//                                     '${dateTo.day}/${dateTo.month}/${dateTo.year}',
//                                     border: InputBorder.none,
//                                     focusedBorder: InputBorder.none,
//                                   ),
//                                   style: TextStyle(
//                                       color: black_273433,
//                                       fontFamily: sf_pro_display_medium,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w500,
//                                       fontStyle: FontStyle.normal),
//                                   onTap: () {
//                                     selectToDate(context);
//                                   }),
//                             ],
//                           ),
//                           flex: 1,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//
//
//
//             /*Button code here*/
//             Container(
//               margin: EdgeInsets.only(left: 24, right: 24, top: 24),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Set recurring order",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontFamily: sf_pro_display_bold,
//                               fontWeight: FontWeight.w700,
//                               fontStyle: FontStyle.normal),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         SvgPicture.asset(
//                           icon_forward,
//                           width: 25,
//                           height: 25,
//                         ),
//                       ],
//                     ),
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       primary: skygreen_24d39e,
//                       onPrimary: Colors.white,
//                       elevation: 0,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 0, vertical: 18),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         side: BorderSide(color: skygreen_24d39e, width: 0),
//                       ),
//                     )),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void selectDate(BuildContext context) async {
//     DateTime newDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2040),
//     );
//     if (newDate == null) return;
//     setState(() => dateFrom = newDate);
//   }
//
//   void selectToDate(BuildContext context) async {
//     DateTime newDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2040),
//     );
//     if (newDate == null) return;
//     setState(() => dateTo = newDate);
//   }
//
//   DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
//         value: item,
//         child: Text(
//           item,
//           style: TextStyle(
//               fontSize: 12,
//               color: black_273433,
//               fontFamily: sf_pro_display_medium,
//               fontWeight: FontWeight.w500,
//               fontStyle: FontStyle.normal),
//         ),
//       );
// }
//
// class AlwaysDisabledFocusNode extends FocusNode {
//   @override
//   bool get hasFocus => false;
// }
