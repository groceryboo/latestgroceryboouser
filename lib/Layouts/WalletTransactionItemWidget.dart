import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Screens/PaymentFlow/Wallet/controller/WalletController.dart';
import 'package:groceryboouser/Screens/PaymentFlow/Wallet/model/WalletDetailModel.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:intl/intl.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_strings.dart';

class WalletTransactionItemWidget extends StatefulWidget {
  
  const WalletTransactionItemWidget({Key key, this.transactionModel})
      : super(key: key);

  final Transaction transactionModel;

  @override
  State<WalletTransactionItemWidget> createState() => _WalletTransactionItemWidgetState();
}

class _WalletTransactionItemWidgetState extends State<WalletTransactionItemWidget> {
  WalletController controller = Get.put(WalletController());
  
  @override
  void initState() {
    super.initState();
    var date = DateTime.parse(widget.transactionModel.date.substring(0,10) + ' ' + widget.transactionModel.date.substring(11,23));
    controller.date.value = DateFormat("MMM dd yyyy").format(date);
    controller.time.value = DateFormat("HH:mm a").format(date);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 15), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            setRegulerText('Topup', 14.0, green_24D39E,
                FontWeight.w600, FontStyle.normal),
            SizedBox(
              height: 10,
            ),
            setRegulerText(widget.transactionModel.transactionType, 12.0, grey_96a6a3,
                FontWeight.w400, FontStyle.normal),
            SizedBox(
              height: 5,
            ),
            setRegulerText('Grocery Boo', 14.0, Colors.black,
                FontWeight.w600, FontStyle.normal),
          ]),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                // Date Widget
                setRegulerText("${controller.date.value} at ${controller.time.value}", 11.0, grey_96a6a3,
                    FontWeight.w400, FontStyle.normal),
                SizedBox(
                  height: 20,
                ),
                setRegulerText(
                    widget.transactionModel.amount,
                    16.0,
                    skygreen_24d39e,
                    FontWeight.w600,
                    FontStyle.normal),
              ])),
        ]),
      ),
    );
  }
}
