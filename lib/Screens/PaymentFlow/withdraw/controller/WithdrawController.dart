import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Screens/PaymentFlow/withdraw/model/RecentWithdrawModel.dart';
import 'package:groceryboouser/Screens/PaymentFlow/withdraw/model/SelectBankAccountModel.dart';
import 'package:groceryboouser/Screens/PaymentFlow/withdraw/view/ChooseBankAccountPage.dart';
import 'package:groceryboouser/Screens/ProfileInfo/model/UserProfileModel.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:http/http.dart' as http;

class WithdrawController extends GetxController {
  var preferences = MySharedPref();

  //recent withdrawals
  RxString balance = "".obs;
  RxList withdrawalList = [].obs;
  RxString recentDate = "".obs;
  RxString recentTime = "".obs;
  RxString account = "".obs;

  //Add Bank Account
  Rx<TextEditingController> bankName = TextEditingController().obs;
  Rx<TextEditingController> accountNo = TextEditingController().obs;
  Rx<TextEditingController> routingNo = TextEditingController().obs;
  Rx<TextEditingController> bankAddress = TextEditingController().obs;
  RxInt selectedSaveAsIndex = 1.obs;

  //Select Bank Account
  RxList bankAccountList = [].obs;

  RxString token = "".obs;
  Rx<SigninModel> profileModel = SigninModel().obs;

  userInfoModel() async {
    print("First Call");

    //User Personal details
    profileModel.value =
        await preferences.getSignInModel(SharePreData.key_SaveSignInModel);

    token.value = profileModel.value.data.token;
  }

  recentWithdrawalApi() async {
    await userInfoModel();

    String url = urlBase + urlRecentWithdraw;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token.value).then((value) async {
      print(value);
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> recentWithdrawModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(recentWithdrawModel);

          printData("Recent Withdraw message", model.message.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            recentWithdrawalApi();
          } else if (model.statusCode == 200) {
            RecentWithdrawModel recentWithdraw =
                RecentWithdrawModel.fromJson(recentWithdrawModel);

            balance.value = recentWithdraw.data.balance;
            withdrawalList.value = recentWithdraw.data.recentWithdraw;
          } else {
            printData("Recent Withdraw Status", model.statusCode.toString());
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  addAccountApi(BuildContext context) async {
    await userInfoModel();

    String url = urlBase + urlAddAccount;
    final apiReq = Request();

    var body = {
      'bank_name': bankName.value.text,
      'account_number': accountNo.value.text,
      'routing_number': routingNo.value.text,
      'bank_address': bankAddress.value.text,
      'account_type': selectedSaveAsIndex.value.toString(),
      'swift_code': "0",
      'image': "null",
      'save_as': selectedSaveAsIndex.value.toString(),
    };

    await apiReq.postAPI(url, body, token.value).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> addAccountModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(addAccountModel);
          if (model.statusCode == 200) {
            Navigator.pop(context);
            Get.to(WithdrawChooseBankAccount());
          } else {
            Navigator.pop(context);
            snackBar(context, model.message);
          }
        });
      } else {
        snackBar(context, res.reasonPhrase);
      }
    });
  }

  selectAccountApi() async {
    await userInfoModel();

    String url = urlBase + urlSelectAccount;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token.value).then((value) async {
      print(value);
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> selectBankModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(selectBankModel);

          printData("Select Account message", model.message.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            selectAccountApi();
          } else if (model.statusCode == 200) {
            SelectBankAccountModel selectBankAccountModel =
                SelectBankAccountModel.fromJson(selectBankModel);

            bankAccountList.value = selectBankAccountModel.data;
          } else {
            printData("Select Account", model.statusCode.toString());
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }
}
