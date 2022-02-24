import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Screens/PaymentFlow/Wallet/controller/WalletController.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:intl/intl.dart';
import '../../../../Layouts/ToolbarWithHeaderAction.dart';
import '../../../../Layouts/WalletTransactionItemWidget.dart';
import '../../../../Styles/my_colors.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utils/SizeConfig.dart';
import '../../../../Styles/my_colors.dart';
import '../../../../Styles/my_colors.dart';
import '../../../../Styles/my_height.dart';
import '../../../../Styles/my_icons.dart';
import '../../../../Utilities/Constant.dart';
import '../../../../Utils/SizeConfig.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key key}) : super(key: key);

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  WalletController controller = Get.put(WalletController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.endDate.value = DateTime.now();
    controller.startDate.value = DateTime(controller.endDate.value.year,
        controller.endDate.value.month - 1, controller.endDate.value.day);

    controller.filterStartDate.value =
        DateFormat("MMM dd yyyy").format(controller.startDate.value);
    controller.filterEndDate.value =
        DateFormat("MMM dd yyyy").format(controller.endDate.value);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Obx(
      () => SafeArea(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(
                    SizeConfig.screenWidth * 0.05,
                    0,
                    SizeConfig.screenWidth * 0.05,
                    SizeConfig.screenHeight * 0.025),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ToolbarWithHeaderAction(
                        transaction_history, filter_item_icon, () {
                      _openBottomSheet(context);
                    }),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.025,
                    ),
                    GestureDetector(
                        onTap: () {
                          _openBottomSheet(context);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              calendar_icon,
                              height: 13,
                              width: 13,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            setRegulerText(
                                "${controller.filterStartDate.value} - ${controller.filterEndDate.value}",
                                12,
                                Colors.black,
                                FontWeight.w500,
                                FontStyle.normal),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: grey_96a6a3,
                            ),
                          ],
                        )),
                  ],
                )),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(
                        SizeConfig.screenWidth * 0.05,
                        0,
                        SizeConfig.screenWidth * 0.05,
                        SizeConfig.screenHeight * 0.025),
                    itemCount: controller.transactionList.length,
                    itemBuilder: ((context, index) {
                      return _listviewItem(context, index);
                    })))
          ],
        ),
      ),
    ));
  }

  selectStartDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: controller.startDate.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: skygreen_24d39e,
                onPrimary: white_ffffff,
                surface: white_ffffff,
                onSurface: black,
              ),
              dialogBackgroundColor: white_ffffff,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      controller.startDate.value = newSelectedDate;
      controller.filterStartDate.value =
          DateFormat("MMM dd yyyy").format(newSelectedDate);
    }
  }

  selectEndDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: controller.endDate.value,
        firstDate: DateTime(1990),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: skygreen_24d39e,
                onPrimary: white_ffffff,
                surface: white_ffffff,
                onSurface: black,
              ),
              dialogBackgroundColor: white_ffffff,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      controller.endDate.value = newSelectedDate;
      controller.filterEndDate.value =
          DateFormat("MMM dd yyyy").format(newSelectedDate);
    }
  }

  Widget _listviewItem(context, index) {
    return WalletTransactionItemWidget(
      transactionModel: controller.transactionList[index],
    );
  }

  _openBottomSheet(context) {
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (BuildContext context) {
          return Obx(
            () => Container(
              height: SizeConfig.screenHeight / 2.5,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.05,
                  vertical: SizeConfig.screenHeight * 0.025),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 50,
                        height: 3,
                        color: grey_96a6a3,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: setSemiBoldPoppinsText(
                          filter_transaction_history,
                          14.0,
                          Colors.black,
                          FontWeight.w700,
                          FontStyle.normal)),
                  SizedBox(
                    height: 40,
                  ),
                  setSemiBoldSFProText(date_filter, 16.0, Colors.black,
                      FontWeight.w600, FontStyle.normal),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                selectStartDate(context);
                              },
                              child: Card(
                                  color: Colors.grey[300],
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            calendar_circle,
                                            height: 32,
                                            width: 32,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                setMediumSFProText(
                                                    from_text,
                                                    11,
                                                    grey_96a6a3,
                                                    FontWeight.w500,
                                                    FontStyle.normal),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                setRegulerText(
                                                    controller
                                                        .filterStartDate.value,
                                                    14,
                                                    Colors.black,
                                                    FontWeight.w700,
                                                    FontStyle.normal),
                                              ]),
                                        ],
                                      ))))),
                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                selectEndDate(context);
                              },
                              child: Card(
                                  color: Colors.grey[300],
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            calendar_circle,
                                            height: 32,
                                            width: 32,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                setMediumSFProText(
                                                    to_text,
                                                    11,
                                                    grey_96a6a3,
                                                    FontWeight.w500,
                                                    FontStyle.normal),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                setRegulerText(
                                                    controller
                                                        .filterEndDate.value,
                                                    14,
                                                    Colors.black,
                                                    FontWeight.w700,
                                                    FontStyle.normal),
                                              ]),
                                        ],
                                      ))))),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color(0x17747796).withOpacity(0.07),
                        spreadRadius: 10,
                        blurRadius: 10,
                        offset: Offset(0, 20), // changes position of shadow
                      ),
                    ]),
                    child: SizedBox(
                      width: double.infinity,
                      height: HeightData.sixty,
                      child: ElevatedButton(
                          child: //
                              Text("Search Filter",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: sf_pro_display_bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.left),
                          onPressed: () {
                            
                          },
                          style: ElevatedButton.styleFrom(
                            primary: skygreen_24d39e,
                            onPrimary: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 21),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side:
                                  BorderSide(color: skygreen_24d39e, width: 0),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
