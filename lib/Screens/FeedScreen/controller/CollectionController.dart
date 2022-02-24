import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Screens/FeedScreen/model/CollectionListModel.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:http/http.dart' as http;

import '../../../Model/SigninModel.dart';
import '../../../Styles/my_strings.dart';
import '../../../Utils/preference_utils.dart';
import '../../../Utils/share_predata.dart';
import '../../../Utils/text_utilities.dart';
import '../../Authentication/SignUp/model/CityListModel.dart';
import '../model/CreateCollectionModel.dart';

class FeedController extends GetxController {
  List<CollectionDatum> collectionList = [];
  SigninModel modelM;
  CreateCollectionModel createCollectionModel;

  // bool isImageUploaded = false;

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
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8zNS4xNTMuMjM0LjIyOFwvZ3JvY2VyeWJvb1wvYXBpXC9jb21tb25cL21vYmlsZVwvbG9naW4iLCJpYXQiOjE2NDUyNjc4MzUsImV4cCI6MTY0NTM1NDIzNSwibmJmIjoxNjQ1MjY3ODM1LCJqdGkiOiJaWEZTcWZZS29qNUxpM0U2Iiwic3ViIjozLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.aKKms8OuUcxqsxazmbII8yWGJ5_Y4nenkF_UFemp_9E";
  }

  Future callCollectionListApi(BuildContext context) async {
    onLoading(context, "Loading..");

    // Calling function for prefs values
    initPrefs();

    String url = urlBase + userCollectionList;

    final apiReq = Request();

    dynamic body = {
      'country_id': "countryId",
    };

    await apiReq.postWithoutBearer(url, token).then((value) async {
      Navigator.pop(context); //pop dialog

      // clearning list before getting response
      collectionList.clear();

      http.Response res = value;

      if (res.statusCode == 200) {
        // await res.stream.bytesToString().then((value) async {
        //   String strData = value;
        print(res.body);
        Map<String, dynamic> collectionModel = json.decode(res.body);
        BaseModel model = BaseModel.fromJson(collectionModel);

        if (model.statusCode == 200) {
          CollectionListModel collectionListModel =
              CollectionListModel.fromJson(collectionModel);

          collectionList = collectionListModel.data;
          printData("CollectionList Model ", collectionList.toString());
        } else {
          print(res.reasonPhrase);
        }
        // });
      }
    });
  }

  Future<void> callCreateCollectionApi(
      String name, var image, BuildContext context) async {
    onLoading(context, "Loading..");

    await initPrefs();

    String url = urlBase + createCollection;

    final apiReq = Request();

    dynamic body = {
      'name': name,
    };

    await apiReq.postAPIWithMedia(url, body, token, image).then((value) async {
      http.StreamedResponse res = value;
      Navigator.pop(context); //pop dialog

      // setting Empty model before getting response
      createCollectionModel = CreateCollectionModel();

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          print("---->> " + strData);
          if (model.statusCode == 200) {
            createCollectionModel = CreateCollectionModel.fromJson(userModel);

            printData("CountryList Model ", createCollectionModel.toString());
            // await showFlutterToast(model.message);
            await snackBar(context, model.message);

          } else {
            print(res.reasonPhrase);
            await snackBar(context, model.message);
          }
        });
      } else {
        await snackBar(context, something_went_wrong);
      }
    });
  }
}
