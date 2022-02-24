import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/CategoryModelStatic.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Categoryscreen/model/ProductModelWithVeriant.dart';
import 'package:groceryboouser/Screens/Categoryscreen/model/RecommendedPinnedListModel.dart';
import 'package:groceryboouser/Screens/Homepage/model/CategoryModel.dart';
import 'package:groceryboouser/Screens/Homepage/view/HomepageView.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';

import 'package:http/http.dart' as http;

import '../model/ProductModel.dart';

class CategoryController extends GetxController {

  RxList<Product> categoryList=<Product>[].obs;
  RxList<ListOfPinned> recommendedList=<ListOfPinned>[].obs;
  RxList<ProductModelWithVeriantimportCategory> productModelWithVeriantimportCategory=<ProductModelWithVeriantimportCategory>[].obs;
  //int getProductId=1;
  RxBool boolgetProductId = false.obs;
  RxBool boolDisplayproduct = false.obs;
  RxBool boolProductModelWithVeriantimportCategoryproduct = false.obs;
  RxBool boolRecommendedPinnedList = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init State");
    displaycategoryList();
    displayRecommendedPinnedList();
    displayFruitList();

  }

  displaycategoryList() async {
    var preferences = MySharedPref();
    SigninModel myModel = await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel?.data.token;
    String url = urlBase + urlcategoryList;

    dynamic body = {
      'category_id': "1",
      'parent_category_id':"1",
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
            ProductModel productModel = ProductModel.fromJson(userModel);
            categoryList = productModel.data;

            printData("Category list", categoryList.toString());
            printData("Category list length", categoryList.length.toString());

            if(categoryList.length>0){
              boolDisplayproduct.value = true;
            }else{
              boolDisplayproduct.value = false;
            }

            printData("Category list", categoryList.toString());
          }

        });
      }else{
        print(res.reasonPhrase);
      }


    });
  }
  displayFruitList() async {
    var preferences = MySharedPref();
    SigninModel myModel =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel?.data.token;
    String url = urlBase + urlproductList;

    dynamic body = {
      'category_id': "1",
      'parent_category_id':"1",
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

            displayFruitList();
          }else if(model.statusCode==200){
            ProductModelWithVeriantimport productModelWithVeriantimport = ProductModelWithVeriantimport.fromJson(userModel);
            productModelWithVeriantimportCategory = productModelWithVeriantimport.data;

            printData("productModelWithVeriantimportCategory", productModelWithVeriantimportCategory.toString());
            printData("productModelWithVeriantimportCategory length", productModelWithVeriantimportCategory.length.toString());

            if(productModelWithVeriantimportCategory.length>0){
              boolProductModelWithVeriantimportCategoryproduct.value = true;
            }else{
              boolProductModelWithVeriantimportCategoryproduct.value = false;
            }

            printData("Category list", productModelWithVeriantimportCategory.toString());
          }

        });
      }else{
        print(res.reasonPhrase);
      }


    });
  }

  Future<void> addToCart(String productId,BuildContext context)async{
    var preferences = MySharedPref();
    SigninModel myModel =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel?.data.token;
    String url = urlBase + urladdToCart;

    dynamic body = {
      'product_id':productId,
    };

    final apiReq = Request();
    await apiReq.postAPI(url, body,token).then((value) async {
      http.StreamedResponse res = value;

      printData("product List API response status code" , res.statusCode.toString());
      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);
          print(model.statusCode);

          if(model.statusCode==200){
            Navigator.pop(context); //pop dialog
            snackBar(context, "Add Items successfully");
          }else if(model.statusCode==101){
            Navigator.pop(context); //pop dialog
            snackBar(context, model.message);
          }else{
            Navigator.pop(context); //pop dialog
            snackBar(context,"Resend Code");
          }
        });
      }
      else {
      }
    });

  }

  Future<void> multivariantAPI(String productId,BuildContext context) async {
    var preferences = MySharedPref();
    SigninModel myModel =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel?.data.token;
    String url = urlBase + urlSingleproduct;

    dynamic body = {
      'product_id':productId,
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

            //displaycategoryList();
          }else if(model.statusCode==200){
            ProductModelWithVeriantimport productModelWithVeriantimport = ProductModelWithVeriantimport.fromJson(userModel);
            productModelWithVeriantimportCategory = productModelWithVeriantimport.data;

            printData("productModelWithVeriantimportCategory", productModelWithVeriantimportCategory.toString());
            printData("productModelWithVeriantimportCategory length", productModelWithVeriantimportCategory.length.toString());

            if(categoryList.length>0){
              boolProductModelWithVeriantimportCategoryproduct.value = true;
            }else{
              boolProductModelWithVeriantimportCategoryproduct.value = false;
            }

            printData("Category list", productModelWithVeriantimportCategory.toString());
          }

        });
      }else{
        print(res.reasonPhrase);
      }


    });
  }

  displayRecommendedPinnedList() async {
    var preferences = MySharedPref();
    SigninModel myModel =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel?.data.token;
    String url = urlBase + urlRecommendedPinnedList;



    final apiReq = Request();
    await apiReq.postAPI(url, null,token).then((value) async {
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

            displayRecommendedPinnedList();
          }else if(model.statusCode==200){
            RecommendedPinnedListModel productModelWithVeriantimport = RecommendedPinnedListModel.fromJson(userModel);
            recommendedList = productModelWithVeriantimport.data;

            printData("recommendedList", recommendedList.toString());
            printData("recommendedList length", recommendedList.length.toString());

            if(recommendedList.length>0){
              boolRecommendedPinnedList.value = true;
            }else{
              boolRecommendedPinnedList.value = false;
            }

            printData("Category list", recommendedList.toString());
          }

        });
      }else{
        print(res.reasonPhrase);
      }


    });
  }

}