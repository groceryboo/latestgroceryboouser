import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Utils/SizeConfig.dart';

import '../Utilities/Constant.dart';

class BottomSheetTest extends StatefulWidget {
  const BottomSheetTest({Key key}) : super(key: key);

  @override
  _BottomSheetTestState createState() => _BottomSheetTestState();
}

class _BottomSheetTestState extends State<BottomSheetTest> {
  var _currencies = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  var _currentSelectedValue = 'Monday';
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MaterialButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      builder: (context) {
                        return DefaultTabController(
                          length: 2,
                          child: Scaffold(
                            body: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2,
                                      bottom: SizeConfig.blockSizeVertical * 2),
                                  child: Text(
                                    'Set recurring order',
                                    style: TextStyle(
                                        color: black_273433,
                                        fontSize: 18,
                                        fontFamily: sf_pro_display_bold),
                                  ),
                                ),
                                Divider(
                                  color: gray_f4f6f6,
                                  thickness: 1,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.screenWidth * 0.05,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: SizeConfig.screenWidth * 0.2,
                                        child: Text(
                                          'Repeat on',
                                          style: TextStyle(
                                              color: black_273433,
                                              fontSize: 14,
                                              fontFamily: sf_pro_display_bold),
                                        ),
                                      ),
                                      Container(
                                        width: SizeConfig.screenWidth * 0.6,
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: gray_f3f6f6,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: TabBar(
                                          tabs: [
                                            Tab(
                                              child: Text(
                                                'Every Day',
                                                style: TextStyle(
                                                  fontFamily:
                                                      sf_pro_display_medium,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            Tab(
                                              child: Text(
                                                'Every Month',
                                                style: TextStyle(
                                                  fontFamily:
                                                      sf_pro_display_medium,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                          indicator: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          unselectedLabelColor: grey_96a6a3,
                                          labelColor: black_273433,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: gray_f4f6f6,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 150,
                                  child: TabBarView(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left:
                                                    SizeConfig.screenWidth *
                                                        0.05,
                                            right: SizeConfig.screenWidth * 0.05,
                                            top: SizeConfig.blockSizeVertical ),
                                            child: FormField<String>(
                                              builder: (FormFieldState<String>
                                                  state) {
                                                return InputDecorator(
                                                  decoration: InputDecoration(
                                                      labelStyle: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily:
                                                              sf_pro_display_medium,
                                                          color: Color(
                                                              0xff96a6a3)),
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  5),
                                                      errorStyle: TextStyle(
                                                          color:
                                                              Colors.redAccent,
                                                          fontSize: 16.0),
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          borderSide: BorderSide(
                                                              color:
                                                                  grey_e9ecec))),
                                                  isEmpty:
                                                      _currentSelectedValue ==
                                                          '',
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton<String>(
                                                      value:
                                                          _currentSelectedValue,
                                                      isDense: true,
                                                      onChanged:
                                                          (String newValue) {
                                                        setState(() {
                                                          _currentSelectedValue =
                                                              newValue;
                                                          state.didChange(
                                                              newValue);
                                                        });
                                                      },
                                                      items: _currencies
                                                          .map((String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal:
                                                    SizeConfig.screenWidth *
                                                        0.05,
                                                vertical: SizeConfig
                                                    .blockSizeVertical * 2),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    _selectDate(context);
                                                  },
                                                  child: Container(
                                                    width: 159,
                                                    height: 63,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          color: Color(
                                                              0xffe9ecec)),
                                                      color: Color(0xfff3f6f6),
                                                    ),
                                                    padding: EdgeInsets.all(8),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .white),
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          child:
                                                              SvgPicture.asset(
                                                            calendar_icon,
                                                            color: Color(
                                                                0xff96a6a3),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              4,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'From',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff96a6a3),
                                                                  fontSize: 11,
                                                                  fontFamily:
                                                                      sf_pro_display_regular),
                                                            ),
                                                            Text(
                                                              "${selectedDate.toLocal()}"
                                                                  .split(
                                                                      ' ')[0],
                                                              style: TextStyle(
                                                                  color:
                                                                      black_273433,
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      sf_pro_display_medium),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    _selectDate(context);
                                                  },
                                                  child: Container(
                                                    width: 159,
                                                    height: 63,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          color: Color(
                                                              0xffe9ecec)),
                                                      color: Color(0xfff3f6f6),
                                                    ),
                                                    padding: EdgeInsets.all(8),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .white),
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          child:
                                                              SvgPicture.asset(
                                                            calendar_icon,
                                                            color: Color(
                                                                0xff96a6a3),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              4,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'To',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff96a6a3),
                                                                  fontSize: 11,
                                                                  fontFamily:
                                                                      sf_pro_display_regular),
                                                            ),
                                                            Text(
                                                              "${selectedDate.toLocal()}"
                                                                  .split(
                                                                      ' ')[0],
                                                              style: TextStyle(
                                                                  color:
                                                                      black_273433,
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      sf_pro_display_medium),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.screenWidth * 0.05
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    height: 60,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    color: skygreen_24d39e,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Set recurring order',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: sf_pro_display_bold,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal * 4,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 18,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Text('Show Bottom Sheet',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                color: skygreen_24d39e,
                height: SizeConfig.blockSizeVertical * 5,
                minWidth: SizeConfig.screenWidth,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
