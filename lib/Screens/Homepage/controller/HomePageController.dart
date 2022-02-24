import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Homepage/model/AddressModel.dart';
import 'package:groceryboouser/Screens/Homepage/model/CategoryModel.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:http/http.dart' as http;

class HomePageController extends FullLifeCycleController {

  RxBool boolDisplayAddresses = false.obs;
  RxBool boolAddressIcon = false.obs;
  RxBool boolCategory = false.obs;
  var isLoading = true.obs;
  var CategoryList = <Category>[].obs;
  RxList<AddressDatum> addressList =<AddressDatum>[].obs ;
  //late RxList<Category> CategoryList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init State");
    displayAddressList();
    displayCategoryList();
  }

  displayAddressList() async {
    var preferences = MySharedPref();
    //User Personal details
    SigninModel myModel =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel.data.token;

    String url = urlBase + urlAddressesList;

    final apiReq = Request();
    await apiReq.postAPI(url, null, token).then((value) {
      http.StreamedResponse res = value;

      printData("Address List API response status code" , res.statusCode.toString());

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("Address List API response message" , model.message.toString());

          if(model.statusCode ==500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            displayAddressList();
          }else if(model.statusCode==200){
            AddressModel addressModel = AddressModel.fromJson(userModel);
            addressList.value = addressModel.data;

            printData("Address list", addressList.toString());
            printData("Address list length", addressList.length.toString());

            if(addressList.length>0){
             Get.obs;
             boolDisplayAddresses.value = true;
            }else{
              boolDisplayAddresses.value = false;
            }

            printData("Address list", boolDisplayAddresses.toString());
          }

        });
      }else{
            print(res.reasonPhrase);
      }

    });
  }

  displayCategoryList() async {
    isLoading(true);
    var preferences = MySharedPref();
    //User Personal details
    SigninModel myModel =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel?.data.token;

    String url = urlBase + urlcategoryList;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token).then((value) {
      http.StreamedResponse res = value;

      printData("Category List API response status code" , res.statusCode.toString());

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("Category List API response message" , model.message.toString());

          if(model.statusCode ==500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            displayCategoryList();
          }else if(model.statusCode==200){
            CategoryModel categoryModel = CategoryModel.fromJson(userModel);
            CategoryList = categoryModel.data;

            //CategoryList.addAll(categoryModel.data);

            printData("Category list", CategoryList.toString());
            printData("Category list length", CategoryList.length.toString());

            if(CategoryList.length>0){
              isLoading(false);
              boolCategory.value = true;
            }else{
              boolCategory.value = false;
            }

            printData("Category list", boolCategory.toString());
          }

        });
      }else{
        print(res.reasonPhrase);
      }

    });
  }

}

