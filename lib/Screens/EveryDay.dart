// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:groceryboouser/Styles/my_colors.dart';
// import 'package:groceryboouser/Styles/my_icons.dart';
// import 'package:groceryboouser/Utilities/Constant.dart';
// import 'package:groceryboouser/Utilities/TextUtilities.dart';
// import 'package:intl/intl.dart';
//
// class EveryDay extends StatefulWidget {
//
//
//   @override
//   _EveryDayState createState() => _EveryDayState();
// }
//
// class _EveryDayState extends State<EveryDay> {
//
//   /*First Date Picker*/
//   late DateTime _selectedDate;
//   TextEditingController _textEditingController = TextEditingController();
//
//   /*Second Date Picker*/
//   late DateTime _selectedDateseond;
//   TextEditingController _textEditingControllersecond = TextEditingController();
//
//
//   @override
//   void initState() {
//     _dropDownMenuItems = getDropDownMenuItems();
//     _currentCountry = _dropDownMenuItems[0].value;
//     super.initState();
//   }
//
//   /*Spinner Code is here*/
//
//   List _day =
//   ["Select", "Sunday", "Monday", "Tuesday","Wednesday","Thursday","Friday","Saturday"];
//
//   List<DropdownMenuItem<String>> _dropDownMenuItems;
//   laString _currentCountry;
//
//   List<DropdownMenuItem<String>> getDropDownMenuItems() {
//     List<DropdownMenuItem<String>> items = new List();
//     for (String city in _day) {
//       items.add(new DropdownMenuItem(
//           value: city,
//           child: new Text(city, style: TextStyle(color: black_273433,
//               fontWeight: FontWeight.w500,
//               fontFamily: sf_pro_display_medium,
//               fontStyle: FontStyle.normal,
//               fontSize: 14.0),)
//       ));
//     }
//
//     return items;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           body: Padding(
//             padding: const EdgeInsets.only(left: 24,right: 24,top: 18,bottom: 18),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 /*Spinner Code is here*/
//                 Container(
//
//                   height: 50,
//                   decoration: new BoxDecoration(
//                       color: Color(0x66f3f6f6),
//                       border: Border.all(color: Color(0xffe9ecec)),
//                       borderRadius: BorderRadius.circular(6.7)),
//                   child: Row(
//                     children: <Widget>[
//                       Expanded(
//                         flex: 1,
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               left: 10, right: 10),
//                           child: DropdownButtonHideUnderline(
//                             child: new DropdownButton(
//
//                               isExpanded: false,
//                               value: _currentCountry,
//                               items: _dropDownMenuItems,
//                               onChanged: changedDropDownItem,
//                               icon: SvgPicture.asset(
//                                 iconDown_arrow_black, width: 21.3, height: 21.3,color: black_273433,),
//
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 Container(
//                   width: 180,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                           Radius.circular(5)
//                       ),
//                       color:  Color(0xfff5f5f5)
//                   ),
//                   child: Padding(
//                     padding:  EdgeInsets.only(top: 10,bottom: 10,left: 11.7,right: 15),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Expanded(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               setMediumSFProText("Date", 14, black, FontWeight.w500, FontStyle.normal),
//                               SizedBox(height: 2,),
//
//
//                               Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Expanded(
//                                     child: new TextField(
//                                       focusNode: AlwaysDisabledFocusNode(),
//                                       controller: _textEditingController,
//                                       onTap: () {
//                                         _selectDate(context);
//                                       },
//                                       style:  TextStyle(
//                                           color: grey_96a6a3,
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: sf_pro_display_regular,
//                                           fontStyle:  FontStyle.normal,
//                                           fontSize: 15.0
//                                       ),
//                                       decoration: new InputDecoration(
//                                           isDense: true,
//                                           contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                                           border: InputBorder.none,
//                                           hintText: "06/10/2021"
//
//                                       ),
//                                       keyboardType: TextInputType.text,
//                                       cursorColor: black_273433,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 30,),
//                         Icon(Icons.calendar_today,size: 20,)
//                       ],
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ));
//   }
//
//   void changedDropDownItem(String selectedCountry) {
//     setState(() {
//       _currentCountry = selectedCountry;
//     });
//   }
//
//
//   /* TextView on Date Picker Code is here*/
//   _selectDate(BuildContext context) async {
//     DateTime newSelectedDate = await showDatePicker(
//         context: context,
//         initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
//         firstDate: DateTime(1900),
//         lastDate: DateTime(2040),
//         builder: (BuildContext context, Widget child) {
//           return Theme(
//             data: ThemeData.dark().copyWith(
//               colorScheme: ColorScheme.dark(
//                 primary: Colors.black,
//                 onPrimary: Colors.white,
//                 surface: Colors.black,
//                 onSurface: grey_96a6a3,
//
//               ),
//               dialogBackgroundColor: Colors.white,
//             ),
//             child: child,
//           );
//         });
//
//     if (newSelectedDate != null) {
//       _selectedDate = newSelectedDate;
//       _textEditingController
//         ..text = DateFormat.yMMMd().format(_selectedDate)
//         ..selection = TextSelection.fromPosition(TextPosition(
//             offset: _textEditingController.text.length,
//             affinity: TextAffinity.upstream));
//     }
//   }
//
//   /* TextView on Date Picker Code is here*/
//
//   _selectDatesecond(BuildContext context) async {
//     DateTime newSelectedDate = await showDatePicker(
//         context: context,
//         initialDate: _selectedDateseond != null ? _selectedDateseond : DateTime.now(),
//         firstDate: DateTime(1900),
//         lastDate: DateTime(2040),
//         builder: (BuildContext context, Widget child) {
//           return Theme(
//             data: ThemeData.dark().copyWith(
//               colorScheme: ColorScheme.dark(
//                 primary: Colors.black,
//                 onPrimary: Colors.white,
//                 surface: Colors.black,
//                 onSurface: grey_96a6a3,
//               ),
//               dialogBackgroundColor: Colors.white,
//             ),
//             child: child,
//           );
//         });
//
//     if (newSelectedDate != null) {
//       _selectedDateseond = newSelectedDate;
//       _textEditingControllersecond
//         ..text = DateFormat.yMMMd().format(_selectedDateseond)
//         ..selection = TextSelection.fromPosition(TextPosition(
//             offset: _textEditingControllersecond.text.length,
//             affinity: TextAffinity.upstream));
//     }
//   }
//
// }
//
// class AlwaysDisabledFocusNode extends FocusNode {
//   @override
//   bool get hasFocus => false;
//
// }
