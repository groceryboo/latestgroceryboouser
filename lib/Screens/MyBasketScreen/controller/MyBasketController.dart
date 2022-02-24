import 'dart:convert';
import 'package:groceryboouser/Screens/MyBasketScreen/model/BasketListModel.dart';
import 'package:groceryboouser/Screens/MyBasketScreen/view/MyBasket.dart';
import 'package:groceryboouser/Screens/OrderSuccessful.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/CategoryModelStatic.dart';
import 'package:groceryboouser/Model/PinnedGridModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Categoryscreen/model/ProductModelWithVeriant.dart';
import 'package:groceryboouser/Screens/Homepage/model/CategoryModel.dart';
import 'package:groceryboouser/Screens/Homepage/view/HomepageView.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';


class MyBasketController extends GetxController {

  RxList<ProductDetailsModel> basketlistModel=<ProductDetailsModel>[].obs;
  RxBool boolDisplayproduct = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init State");
   // displayBasketList();


  }

  displayBasketList(BuildContext context) async {
    var preferences = MySharedPref();
    SigninModel myModel =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel?.data.token;
    String url = urlBase + urlBasketList;

    // dynamic body = {
    //   'category_id': "1",
    //   'parent_category_id':"1",
    // };

    final apiReq = Request();
    await apiReq.postAPI(url, null,token).then((value) async {
      http.StreamedResponse res = value;

      //printData("product List API response status code" , res.statusCode.toString());

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);
          print(model.statusCode);

          printData("product List API response message" , model.message.toString());

          if(model.statusCode ==500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            displayBasketList(context);
          }else if(model.statusCode==200){
            BasketListModel productModel = BasketListModel.fromJson(userModel);
            basketlistModel = productModel.data;

            printData("Category list", basketlistModel.toString());
            printData("Category list length", basketlistModel.length.toString());

            if(basketlistModel.length>0){
              boolDisplayproduct.value = true;
            }else{
              boolDisplayproduct.value = false;
            }

            printData("Category list", basketlistModel.toString());
          }else if(model.statusCode==101){
            snackBar(context, model.message);
          }

        });
      }else{
        print(res.reasonPhrase);
      }


    });
  }

  void deleteFromBasket(int productId,BuildContext context)async{
    var preferences = MySharedPref();
    SigninModel myModel =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel?.data.token;
    String url = urlBase + urlRemovebasketItem;

    dynamic body = {
      'product_id':productId.toString(),
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
            //Navigator.pop(context); //pop dialog
            snackBar(context, model.message);
            //displayBasketList(context);
            //Get.to(()=>MyBasket());
          }else if(model.statusCode==101){
            //Navigator.pop(context); //pop dialog
            snackBar(context, model.message);
          }else{
           // Navigator.pop(context); //pop dialog
            snackBar(context,"Resend Code");
          }
        });
      }
      else {
      }
    });

  }

  Future<void> orderPlaceAPI(BuildContext context, String store_id,String instruction,String is_wallet,String is_pinned,String address) async {
    var preferences = MySharedPref();
    SigninModel myModel = await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel?.data.token;


    String url = urlBase + urlOrderPlaced;
    final apiReq = Request();

    dynamic body = {
      'store_id': store_id,
      'instruction': instruction,
      'is_wallet': is_wallet,
      'is_pinned': is_pinned,
      'address': address,

    };

   // String url = urlBase + urlcategoryList;
    await apiReq.postAPI(url, body,token).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          print("status code "+ model.statusCode.toString());
          print("status code "+ model.message.toString());

          if (model.statusCode == 200) {
            snackBar(context, model.message);

            String is_pinned=userModel['data']['is_pinned'];
            int id=userModel['data']['id'];
            print(is_pinned);
            Get.to(OrderSuccessful(is_pinned: is_pinned,id: id,));
            // SigninModel signInModel = SigninModel.fromJson(userModel);
            // var preferences = MySharedPref();
            // await preferences.setSignInModel(
            //     signInModel, SharePreData.key_SaveSignInModel);


          } else {
            Navigator.pop(context);
           // Get.offAll(SignIn()); //pop dialog
            snackBar(context, model.message);
          }
        });
      } else if (res.statusCode == 101) {
       // Navigator.pop(context); //pop dialog
       // snackBar(context, "Enter valid Credentials");
      }
    });


  }


}