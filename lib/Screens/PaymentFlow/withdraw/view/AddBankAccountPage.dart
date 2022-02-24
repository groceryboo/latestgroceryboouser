import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Screens/PaymentFlow/withdraw/controller/WithdrawController.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import '../../../../Layouts/ElevatedGreenButton.dart';
import '../../../../Layouts/ToolbarWithHeader.dart';
import '../../../../Styles/my_icons.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utilities/Constant.dart';
import '../../../../Utils/SizeConfig.dart';
import '../../../../Layouts/WalletBalanceWidget.dart';

class WithdrawAddBankAccount extends StatefulWidget {
  const WithdrawAddBankAccount({Key key}) : super(key: key);

  @override
  _WithdrawAddBankAccountState createState() => _WithdrawAddBankAccountState();
}

class _WithdrawAddBankAccountState extends State<WithdrawAddBankAccount> {
  WithdrawController controller = Get.put(WithdrawController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        body: Obx(
          () => SafeArea(
      child: Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.05, 0,
                SizeConfig.screenWidth * 0.05, SizeConfig.screenHeight * 0.025),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ToolbarWithHeader(wallet, false),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: SizeConfig.screenHeight * 0.025),

                          WalletBalanceWidget(
                              amount: "\$6,200"), // Wallet Balance Widget
                          SizedBox(
                            height: 20,
                          ),

                          // set amount lable
                          setRegulerText(set_amount, 16.0, Colors.black,
                              FontWeight.w600, FontStyle.normal),

                          SizedBox(
                            height: 10,
                          ),

                          // set Amount widget
                          Container(
                              height: 56,
                              decoration: BoxDecoration(
                                color: grey_e9ecec,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // padding: EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: setRegulerText(
                                        "1,500",
                                        16.0,
                                        Colors.black,
                                        FontWeight.w700,
                                        FontStyle.normal),
                                  )),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                            child: Icon(Icons.arrow_drop_up)),
                                        GestureDetector(
                                            child: Icon(Icons.arrow_drop_down))
                                      ]),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 50,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: grey_A0B0AD,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: setRegulerText(
                                          doller_symbol,
                                          16.0,
                                          Colors.white,
                                          FontWeight.w700,
                                          FontStyle.normal),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),

                          // Withdraw to lable
                          setRegulerText(withdraw_to, 16.0, Colors.black,
                              FontWeight.w600, FontStyle.normal),

                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              height: HeightData.fifty_three,
                              decoration: BoxDecoration(
                                color: grey_e9ecec,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextField(
                                  controller: controller.bankName.value,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: bank_name,
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          fontFamily: sf_pro_display_regular,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: grey_96a6a3)),
                                ),
                              )),
                          Container(
                              height: HeightData.fifty_three,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: grey_e9ecec,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextField(
                                  controller: controller.accountNo.value,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: account_number,
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          fontFamily: sf_pro_display_regular,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: grey_96a6a3)),
                                ),
                              )),
                          Container(
                              height: HeightData.fifty_three,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: grey_e9ecec,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextField(
                                  controller: controller.routingNo.value,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: routing_numder,
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          fontFamily: sf_pro_display_regular,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: grey_96a6a3)),
                                ),
                              )),
                          Container(
                              height: HeightData.fifty_three,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: grey_e9ecec,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextField(
                                controller: controller.bankAddress.value,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: bank_address,
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontFamily: sf_pro_display_regular,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        color: grey_96a6a3)),
                              )),
                          SizedBox(height: 15),

                          // Withdraw to lable
                          setRegulerText(save_as, 16.0, Colors.black,
                              FontWeight.w600, FontStyle.normal),

                          Row(
                            children: [
                              // Personal Account Widget
                              _accountTypeWidget(
                                  personal_account, personal_account_icon, 1),
                              SizedBox(
                                width: 2,
                              ),
                              // Business Account Widget

                              _accountTypeWidget(
                                  business_account, business_account_icon, 2),
                              SizedBox(
                                width: 2,
                              ),
                              // Family Account Widget

                              _accountTypeWidget(
                                  family_account, family_account_icon, 3)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  CommonElevatedButton(
                      continue_lower_letter, Colors.white, skygreen_24d39e, () {
                    controller.addAccountApi(context);
                  })
                ])),
    ),
        ));
  }

  Widget _accountTypeWidget(accountType, iconValue, index) {
    return Expanded(
      child: GestureDetector(
          onTap: () {
            setState(() {
              controller.selectedSaveAsIndex.value = index;
            });
          },
          child: Stack(
            children: [
              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      iconValue,
                      width: 36,
                      height: 36,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    setRegulerText(accountType, 12.0, Colors.black,
                        FontWeight.w400, FontStyle.normal),
                  ],
                ),
              ),

              // setting selected Save as Account Type
              if (controller.selectedSaveAsIndex.value == index)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 15,
                    height: 15,
                    child: Icon(
                      Icons.check,
                      size: 10,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: blue_0A84FF),
                  ),
                )
            ],
          )),
    );
  }
}
