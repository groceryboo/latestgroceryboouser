
import 'dart:convert';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Screens/OrderHistory/controller/OrderHistoryPastProductModel.dart';
import 'package:groceryboouser/Screens/OrderHistory/model/OrderHistoryProductModel.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:http/http.dart' as http;

class OrderHistoryController extends GetxController {

   RxList<OnGoingOrderList> onGoingOrderList=<OnGoingOrderList>[].obs;
   RxList<PastOrderList> pastOrderList=<PastOrderList>[].obs;
  RxBool boolonGoingOrderList = false.obs;
  RxBool boolonPastOrderList = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init State");
    displayOnGoingList();
    displayPastOrderList();
    //displayAddressList();

  }
  displayOnGoingList() async{
    var preferences = MySharedPref();
    //User Personal details
    SigninModel myModel =
        await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel?.data.token;

    String url = urlBase + urlOngoingOrders;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token).then((value) {
      http.StreamedResponse res = value;

      //printData("Address List API response status code" , res.statusCode.toString());

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("Address List API response message" , model.message.toString());

          if(model.statusCode ==500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            displayOnGoingList();
          }else if(model.statusCode==200){
            DataOfOrder addressModel = DataOfOrder.fromJson(userModel);
            onGoingOrderList = addressModel.pastOrderList;


            printData("Address list", onGoingOrderList.toString());
            printData("Address list length", onGoingOrderList.length.toString());

            if(onGoingOrderList.length>0){
              boolonGoingOrderList.value = true;
            }else{
              boolonGoingOrderList.value = false;
            }

            //printData("Address list", boolDisplayAddresses.toString());
          }

        });
      }else{
        print(res.reasonPhrase);
      }

    });
  }
  displayPastOrderList() async{
    var preferences = MySharedPref();
    //User Personal details
    SigninModel myModel =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel?.data.token;

    String url = urlBase + urlPastOrders;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token).then((value) {
      http.StreamedResponse res = value;

      //printData("Address List API response status code" , res.statusCode.toString());

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("Address List API response message" , model.message.toString());

          if(model.statusCode ==500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            displayOnGoingList();
          }else if(model.statusCode==200){
            DataOfPastOrder addressModel = DataOfPastOrder.fromJson(userModel);
            pastOrderList = addressModel.pastOrderList;

            printData("Address list", pastOrderList.toString());
            printData("Address list length", pastOrderList.length.toString());

            if(pastOrderList.length>0){
              boolonPastOrderList.value = true;
            }else{
              boolonPastOrderList.value = false;
            }

            //printData("Address list", boolDisplayAddresses.toString());
          }

        });
      }else{
        print(res.reasonPhrase);
      }

    });
  }


}