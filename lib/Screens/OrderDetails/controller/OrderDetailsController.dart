
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/CategoryModelStatic.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Categoryscreen/model/ProductModelWithVeriant.dart';
import 'package:groceryboouser/Screens/Homepage/model/CategoryModel.dart';
import 'package:groceryboouser/Screens/Homepage/view/HomepageView.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Screens/OrderDetails/model/OrderDetailModel.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';

import 'package:http/http.dart' as http;

class OrderDetailsController extends GetxController {
   int orderId;
   RxList<OrderItemsList> orderDetailsList=<OrderItemsList>[].obs;
  int getProductId=1;
  RxBool boolorderDetails = false.obs;
  OrderDetailsController({ this.orderId});





  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init State");
    displaycategoryList();


  }

  displaycategoryList() async {
    var preferences = MySharedPref();
    SigninModel myModel =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel?.data.token;
    String url = urlBase + urlOrderDetails;

    dynamic body = {
      'order_id': orderId.toString(),
    };

    final apiReq = Request();
    await apiReq.postAPI(url, body,token).then((value) async {
      http.StreamedResponse res = value;

      printData("product List API response status code" , res.statusCode.toString());

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("product List API response message" , model.message.toString());

          if(model.statusCode ==500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            displaycategoryList();
          }else if(model.statusCode==200){
            DataOfOrderDetails productModel = DataOfOrderDetails.fromJson(userModel);
            orderDetailsList = productModel.OrderDetailsList;

            printData("Category list", orderDetailsList.toString());
            printData("Category list length", orderDetailsList.length.toString());

            if(orderDetailsList.length>0){
              boolorderDetails.value = true;
            }else{
              boolorderDetails.value = false;
            }

            printData("Category list", orderDetailsList.toString());
          }

        });
      }else{
        print(res.reasonPhrase);
      }


    });
  }


}
