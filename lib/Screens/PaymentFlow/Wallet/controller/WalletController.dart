import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Screens/PaymentFlow/Wallet/model/WalletDetailModel.dart';
import 'package:groceryboouser/Screens/ProfileInfo/model/UserProfileModel.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:http/http.dart' as http;

class WalletController extends GetxController {

  var preferences = MySharedPref();

  RxString fullNameText = "".obs;
  RxString walletAmount = "".obs;
  RxInt pinRevenue = 0.obs;
  RxInt adsRevenue = 0.obs;
  RxList transactionList = [].obs;
  RxString date = "".obs;
  RxString time = "".obs;

  RxString filterStartDate = "".obs;
  RxString filterEndDate = "".obs;
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;  

  RxString token = "".obs;
  Rx<SigninModel> profileModel= SigninModel().obs;

  userInfoModel() async {
    print("First Call");

    //User Personal details
    profileModel.value =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);

    fullNameText.value = profileModel.value.data.fullName;
    token.value = profileModel.value.data.token;
   }


  walletDetailApi() async {
    await userInfoModel();

    String url = urlBase + urlWalletDetails;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token.value).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> walletModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(walletModel);

          printData("Wallet Detail message", model.message.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            walletDetailApi();
          }
          else if (model.statusCode == 200) {
            WalletDetailModel walletDetail =
            WalletDetailModel.fromJson(walletModel);

            walletAmount.value = walletDetail.data.walletAmount;
            pinRevenue.value = walletDetail.data.pinRevenue;
            adsRevenue.value = walletDetail.data.adsRevenue;
            transactionList.value = walletDetail.data.transaction;
          } else {
            printData("Wallet Status", model.statusCode.toString());
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }
}