import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Screens/PaymentFlow/withdraw/controller/WithdrawController.dart';
import 'package:groceryboouser/Screens/PaymentFlow/withdraw/model/RecentWithdrawModel.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:intl/intl.dart';

import '../../../../Layouts/ElevatedGreenButton.dart';
import '../../../../Layouts/ToolbarWithHeader.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utils/SizeConfig.dart';
import '../../../../Layouts/WalletBalanceWidget.dart';
import 'ChooseBankAccountPage.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({Key key}) : super(key: key);

  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  WithdrawController controller = Get.put(WithdrawController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.recentWithdrawalApi();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        body: Obx(
          ()=> SafeArea(
      child: Container(
            margin: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.05, 0,
                SizeConfig.screenWidth * 0.05, SizeConfig.screenHeight * 0.025),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ToolbarWithHeader(wallet, false),

                  SizedBox(height: SizeConfig.screenHeight * 0.025),

                  WalletBalanceWidget(amount: "\$${controller.balance}"), // Wallet Balance Widget
                  SizedBox(height: 18),
                  Container(
                      // height: 48,
                      decoration: BoxDecoration(
                        color: grey_e9ecec,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextField(
                          decoration: InputDecoration(
                              // contentPadding: ,
                              hintText: search_text,
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SvgPicture.asset(
                                  search,
                                  height: 16,
                                  width: 16,
                                ),
                              )),
                        ),
                      )),
                  SizedBox(height: 15),
                  setRegulerText(recent_withdraw, 18.0, Colors.black,
                      FontWeight.w700, FontStyle.normal),

                  SizedBox(height: 16),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: _listViewItem,
                    itemCount: controller.withdrawalList.length,
                  )),
                  SizedBox(height: 15),
                  CommonElevatedButton(
                      "Withdraw", Colors.white, skygreen_24d39e, _onWithdrawClick)
                ])),
    ),
        ));
  }

  _onWithdrawClick() {
    print("Withdraw Clicked");

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WithdrawChooseBankAccount()));
  }

// Withdraw List View Items
  Widget _listViewItem(context, index) {
    RecentWithdraw withdrawModel = controller.withdrawalList[index];

    var date = DateTime.parse(controller.withdrawalList[index].date.substring(0,10) + ' ' + controller.withdrawalList[index].date.substring(11,23));
    controller.recentDate.value = DateFormat("MMM dd yyyy").format(date);
    controller.recentTime.value = DateFormat("HH:mm a").format(date);

    var accNo = withdrawModel.account.substring(withdrawModel.account.length - 4);
    controller.account.value = accNo;
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 16.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Withdraw Account Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              setRegulerText(account, 11.0, grey_96a6a3, FontWeight.w400,
                  FontStyle.normal),
              SizedBox(
                height: 5,
              ),
              setRegulerText("********${controller.account.value}", 14.0, Colors.black,
                  FontWeight.w600, FontStyle.normal),
            ],
          ),

          SizedBox(
            width: 15,
          ),

          // Withdraw Date Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                setRegulerText(on_text, 11.0, grey_96a6a3, FontWeight.w400,
                    FontStyle.normal),
                SizedBox(
                  height: 5,
                ),
                setRegulerText("${controller.recentDate} at ${controller.recentTime}", 11.0, black_273433,
                    FontWeight.w400, FontStyle.normal),
              ],
            ),
          ),

          SizedBox(
            width: 15,
          ),

          //Withdraw Status Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              setRegulerText(
                  withdrawModel.status,
                  11.0,
                  withdrawModel.status == paid
                      ? skygreen_24d39e
                      : orange_FB8700,
                  FontWeight.w400,
                  FontStyle.normal),
              SizedBox(
                height: 5,
              ),
              Text(
                "${withdrawModel.amount}",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
