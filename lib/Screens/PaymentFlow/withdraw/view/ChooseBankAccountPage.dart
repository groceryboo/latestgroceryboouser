import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Screens/PaymentFlow/withdraw/controller/WithdrawController.dart';
import 'package:groceryboouser/Screens/PaymentFlow/withdraw/model/SelectBankAccountModel.dart';
import 'package:groceryboouser/Screens/PaymentFlow/withdraw/view/AddBankAccountPage.dart';
import 'package:groceryboouser/Styles/my_colors.dart';

import '../../../../Layouts/ElevatedGreenButton.dart';
import '../../../../Layouts/ToolbarWithHeader.dart';
import '../../../../Styles/my_icons.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utils/SizeConfig.dart';
import '../../../../Utils/text_utilities.dart';

class WithdrawChooseBankAccount extends StatefulWidget {
  const WithdrawChooseBankAccount({Key key}) : super(key: key);

  @override
  _WithdrawChooseBankAccountState createState() =>
      _WithdrawChooseBankAccountState();
}

class _WithdrawChooseBankAccountState extends State<WithdrawChooseBankAccount> {
  WithdrawController controller = Get.put(WithdrawController());

  int _selectedAccountIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.selectAccountApi();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        body: Obx(
          ()=> SafeArea(
      child: Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.05, 0,
                SizeConfig.screenWidth * 0.05, SizeConfig.screenHeight * 0.025),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ToolbarWithHeader(wallet, false),
                  SizedBox(height: SizeConfig.screenHeight * 0.025),
                  setRegulerText("\$620.000", 40.0, Colors.black, FontWeight.w700,
                      FontStyle.normal),
                  SizedBox(
                    height: 15,
                  ),
                  setRegulerText("$your_balance \$8.500.000", 14.0, grey_96a6a3,
                      FontWeight.w400, FontStyle.normal),
                  SizedBox(
                    height: 35,
                  ),
                  setRegulerText(choose_bank_account, 16.0, Colors.black,
                      FontWeight.w600, FontStyle.normal),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: _listViewBankItem,
                          itemCount: controller.bankAccountList.length,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WithdrawAddBankAccount()));
                          },
                          child: Container(
                            height: 44.0,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                // color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                            child: Center(
                              child: setRegulerText(
                                  "+ " + add_bank_account,
                                  14,
                                  Colors.black,
                                  FontWeight.w500,
                                  FontStyle.normal),
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                  SizedBox(height: 15),
                  CommonElevatedButton(
                      continue_lower_letter, Colors.white, skygreen_24d39e, () {
                    print("Continue Clicked");
                  })
                ])),
    ),
        ));
  }

  Widget _listViewBankItem(context, index) {
    BankDetail bankAccount = controller.bankAccountList[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAccountIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color:
              _selectedAccountIndex == index ? Colors.white : Colors.grey[300],
          border: _selectedAccountIndex == index
              ? Border.all(color: skygreen_24d39e)
              : Border.all(color: grey_96a6a3),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            SvgPicture.asset(
              bankAccount.accountType == 3 ? family_account_icon
              : bankAccount.accountType == 2 ? business_account_icon
              : personal_account_icon,
              width: 36,
              height: 36,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  setRegulerText(
                    bankAccount.accountType == 3 ? family_account
                    : bankAccount.accountType == 2 ? business_account
                    : personal_account,
                    14, Colors.black,FontWeight.w500, FontStyle.normal
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  setRegulerText(
                    "****-****-${bankAccount.accountNumber.substring(bankAccount.accountNumber.length - 4)}",
                    12, grey_96a6a3, FontWeight.w400, FontStyle.normal
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SvgPicture.asset(
              _selectedAccountIndex == index ? green_circle_check : oval_icon,
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
