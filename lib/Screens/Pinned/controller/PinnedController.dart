import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Screens/BottomNavigation.dart';
import 'package:groceryboouser/Screens/Categoryscreen/model/PinnedDetailsModel.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Screens/Pinned/model/PinnedListModel.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:http/http.dart' as http;

import '../../../Model/SigninModel.dart';

class PinnedController extends GetxController {
  List<dynamic> pinnedListData = [];

  RxList<PinnedDetailsData> pinnedDetailsArray=<PinnedDetailsData>[].obs;
  RxBool boolPinnedDetails = false.obs;

  SigninModel modelM;
  dynamic pinnedDataModel;

  var token;

  @override
  void onInit() {
    super.onInit();

    print("init State");
  }

  initPrefs() async {
    // var preferences = MySharedPref();
    // modelM = await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    // token = modelM?.data.token;

    // static token for testing
    token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8zNS4xNTMuMjM0LjIyOFwvZ3JvY2VyeWJvb1wvYXBpXC9jb21tb25cL21vYmlsZVwvbG9naW4iLCJpYXQiOjE2NDUxODAyOTQsImV4cCI6MTY0NTI2NjY5NCwibmJmIjoxNjQ1MTgwMjk0LCJqdGkiOiJSbXBVTHBUd0hIeGo0UXVpIiwic3ViIjozLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.-H9LodWYNJviwsZLNHGxCh0kkAcnXQfvHLlZRaeQetA";
  }

  Future callPinnedListApi(BuildContext context) async {
    onLoading(context, "Loading..");

    // Calling function for prefs values
    await initPrefs();

    String url = urlBase + pinnedList;

    final apiReq = Request();

    // dynamic body = {
    //   'country_id': "countryId",
    // };

    await apiReq.postWithoutBearer(url, token).then((value) async {
      Navigator.pop(context); //pop dialog

      // clearning list before getting response
      pinnedListData.clear();

      http.Response res = value;

      if (res.statusCode == 200) {
        // await res.stream.bytesToString().then((value) async {
        //   String strData = value;
        print(res.body);
        Map<String, dynamic> collectionModel = json.decode(res.body);
        BaseModel model = BaseModel.fromJson(collectionModel);

        if (model.statusCode == 200) {
          PinnedListModel pinnedListModel =
              PinnedListModel.fromJson(collectionModel);

          pinnedListData = pinnedListModel.data;
          printData("PinnedList Model ", pinnedList.toString());
        } else {
          print(res.reasonPhrase);
        }
        // });
      }
    });
  }

  Future callPinnedDetailApi(BuildContext context) async {
    onLoading(context, "Loading..");

    // Calling function for prefs values
    await initPrefs();

    String url = urlBase + pinnedDetails;

    final apiReq = Request();

    // dynamic body = {
    //   'country_id': "countryId",
    // };

    await apiReq.postWithoutBearer(url, token).then((value) async {
      Navigator.pop(context); //pop dialog

      http.Response res = value;

      if (res.statusCode == 200) {
        print(res.body);
        Map<String, dynamic> collectionModel = json.decode(res.body);
        BaseModel model = BaseModel.fromJson(collectionModel);

        if (model.statusCode == 200) {
          PinnedListModel _pinnedListModel =
              PinnedListModel.fromJson(collectionModel);
          pinnedDataModel = _pinnedListModel.data;

          printData("PinnedList Model ", pinnedList.toString());
        } else {
          print(res.reasonPhrase);
        }
        // });
      }
    });
  }

  displayPinnedDetails(int id) async {
    var preferences = MySharedPref();
    SigninModel myModel = await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel?.data.token;
    String url = urlBase + urlPinnedDetails;

    dynamic body = {
      'pinned_id': id.toString(),
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

            displayPinnedDetails(id);
          }else if(model.statusCode==200){
            PinnedDetailsModel productModel = PinnedDetailsModel.fromJson(userModel);
            pinnedDetailsArray = productModel.data;

            printData("PinnedDetails", pinnedDetailsArray.toString());
            printData("PinnedDetails length", pinnedDetailsArray.length.toString());

            if(pinnedDetailsArray.length>0){
              boolPinnedDetails.value = true;
            }else{
              boolPinnedDetails.value = false;
            }

            printData("PinnedDetails", pinnedDetailsArray.toString());
          }

        });
      }else{
        print(res.reasonPhrase);
      }


    });
  }
  Future<void> addPinnedAPI(BuildContext context, String imagePath,String title,String description,String categories,int order_id) async {
    //onLoading(context, "Loading..");
    var preferences = MySharedPref();
    SigninModel modelM =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = modelM?.data.token;

    var headers = {'Authorization': 'Bearer ' + token};
    var request =
    http.MultipartRequest('POST', Uri.parse(urlBase + urlPinnedCreated));

    request.files.add(await http.MultipartFile.fromPath('cover', imagePath));
    request.fields.addAll({
      'title': title,
      'description': description,
      'categories': categories,
      'order_id': order_id.toString(),
    });

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("-------");
      await response.stream.bytesToString().then((value) async {
        String strData = value;
        Map<String, dynamic> userModel = json.decode(strData);
        BaseModel model = BaseModel.fromJson(userModel);
        print("model-------${model.statusCode}");

        if (model.statusCode == 500) {
          final tokenUpdate = TokenUpdateRequest();
          await tokenUpdate.updateToken();
          printData("create address", "Token Updated");
          addPinnedAPI(context, imagePath,title,description,categories,order_id);
        }
        else if (model.statusCode == 200) {
          print("success");
          Get.to(BottomNavigation());

          // Navigator.pop(context); //pop dialog
           snackBar(context, model.message);
          // SigninModel signIn = SigninModel.fromJson(userModel);
          // modelM.data.image = signIn.data.image;
          // await preferences.setSignInModel(
          //     modelM, SharePreData.key_SaveSignInModel);

          //Get.to(() => SyncContacts());
        }
        else {
          Navigator.pop(context); //pop dialog
          snackBar(context, model.message);
        }
      });
    } else {
      Navigator.pop(context); //pop dialog
      print(response.reasonPhrase);
    }
  }
}
