import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/model/CityListModel.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/model/CountryListModel.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/view/phoneverificationview.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/view/SignupDetails.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:http/http.dart' as http;

class UpdatedSignupController extends GetxController {

  Rx<TextEditingController> searchCountryText = TextEditingController().obs;
  Rx<TextEditingController> searchCityText = TextEditingController().obs;

  Rx<TextEditingController> firstNameText = TextEditingController().obs;
  Rx<TextEditingController> lastNameText = TextEditingController().obs;
  Rx<TextEditingController> emailText = TextEditingController().obs;
  Rx<TextEditingController> phoneNumText = TextEditingController().obs;

  RxString countryId = "".obs;
  RxString strCountry = "Select Country".obs;
  RxString cityId = "".obs;
  RxString strCity = "Select City".obs;

  List<CountryDatum> countrylist = [];
  List<CountryDatum> allCountrylist = [];

  List<CityDatum> cityList = [];
  List<CityDatum> allCityList = [];

  var listToShow;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init State");

    callCountryListApi();
  }

  callSignupFirstApi(BuildContext context) async {
    onLoading(context, "Loading..");
    String url = urlBase + urlPostRegisterStep1;
    final apiReq = Request();

    dynamic body = {
      'email': emailText.value.text,
      'first_name': firstNameText.value.text,
      'last_name': lastNameText.value.text
    };

    await apiReq.postAPIwithoutBearer(url, body).then((value) async {
      http.StreamedResponse res = value;

      printData("SigninModel", res.statusCode.toString());

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("SigninModel", model.statusCode.toString());
          printData("SigninModel", model.message.toString());

          if (model.statusCode == 200) {
            snackBar(context, model.message);
            SigninModel signInModel = SigninModel.fromJson(userModel);
            var preferences = MySharedPref();
            await preferences.setSignInModel(
                signInModel, SharePreData.key_SaveSignInModel);

            printData("SigninModel", signInModel.data.id.toString());

            Navigator.pop(context); //pop dialog
            print("Success");
            await preferences.setBool(SharePreData.key_isLocationServiceEnabled, false);

            Get.off(SignUpDetails());
          } else {
            Navigator.pop(context); //pop dialog
            snackBar(context, model.message);
          }
        });
      } else if (res.statusCode == 101) {
        Navigator.pop(context); //pop dialog
        snackBar(context, "Enter valid Credentials");
      }
    });
  }

  callCountryListApi() async {
    String url = urlBase + urlPostCountryList;

    final apiReq = Request();

    await apiReq.postAPIwithoutBearer(url, null).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 200) {
            CountryListModel countryListModel =
                CountryListModel.fromJson(userModel);

            allCountrylist.addAll(countryListModel.data);
            countrylist.addAll(allCountrylist);

            printData("CountryList Model ", countryListModel.data.toString());
            printData("CountryList Model ", countrylist.toString());

            // Get.to(SearchPageMine());

          } else {
            print(res.reasonPhrase);
          }
        });
      }
    });
  }

  callCityListApi(String countryId) async {
    String url = urlBase + urlPostCityList;

    final apiReq = Request();

    dynamic body = {
      'country_id': countryId,
    };

    await apiReq.postAPIwithoutBearer(url, body).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 200) {
            CityListModel countryListModel = CityListModel.fromJson(userModel);

// storing all the cities
            allCityList.addAll(countryListModel.data);
// storing cities to display.
            cityList.addAll(allCityList);
            printData("CountryList Model ", cityList.toString());

          } else {
            print(res.reasonPhrase);
          }
        });
      }
    });
  }

  Future<void> callSignupSecondApi(BuildContext context) async {
    onLoading(context, "Loading..");
    var preferences = MySharedPref();
    //User Personal details
    SigninModel myModel =
        await preferences.getSignInModel(SharePreData.key_SaveSignInModel);

    String url = urlBase + urlPostRegisterStep2;
    printData("Status url ", url);

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({
      'user_id': myModel.data.id.toString(),
      'country_id': countryId.value,
      'city_id': cityId.value,
      'phone_number': phoneNumText.value.text,
    });

    http.StreamedResponse response = await request.send();
    printData("Status ", "Entered ");

    if (response.statusCode == 200) {
      printData("Status ", "Enter state 0");
      await response.stream.bytesToString().then((value) async {
        printData("Status ", "Enter state 1");
        String strData = value;
        Map<String, dynamic> userModel = json.decode(strData);
        BaseModel model = BaseModel.fromJson(userModel);

        printData("Status ", model.statusCode.toString());
        printData("Status", model.message.toString());

        if (model.statusCode == 200) {
          SigninModel signInModel = SigninModel.fromJson(userModel);
          var preferences = MySharedPref();
          await preferences.setSignInModel(
              signInModel, SharePreData.key_SaveSignInModel);

          printData("Status ", signInModel.data.id.toString());

          Navigator.pop(context); //pop dialog
          print("Success");

          Get.off(OtpVerification());
        } else {
          Navigator.pop(context); //pop dialog
          snackBar(context, model.message);
        }
      });

      print("check sucess");
    } else {
      Navigator.pop(context); //pop dialog
      print(response.reasonPhrase);

      print("check failed");
    }
  }

  Future<void> clearCountryField() async {
    if (searchCountryText.value.text.isNotEmpty) {
      searchCountryText.value.text = "";
      countrylist.clear();
      countrylist.addAll(allCountrylist);
    }
  }

  Future<void> filterCountryList(String value) async {
    print(" value $value");

    //clearning the list before adding filtered list data

// checking the searched keyword
    if (value.isNotEmpty) {
      countrylist.clear();

      for (int i = 0; i < allCountrylist.length; i++) {
        String name = allCountrylist[i].name;

        if (value.length <= name.length) {
          String rawValue = name.substring(0, value.length);
          print("rawValue $rawValue value $value");

          if (rawValue.toLowerCase() == value.toLowerCase()) {
            countrylist.add(allCountrylist[i]);
          }
        } else {
          print("Else");
        }
      }
    } else {
      countrylist.clear();

      countrylist.addAll(allCountrylist);
      print(countrylist.length);
    }
  }

  Future<void> clearCityField() async {
    if (searchCityText.value.text.isNotEmpty) {
      searchCityText.value.text = "";
      cityList.clear();
      cityList.addAll(allCityList);
    }
  }

  Future<void> filterCityList(String value) async {
    print(" value $value");

    //clearning the list before adding filtered list data
    cityList.clear();

      // checking the searched keyword
    if (value.isNotEmpty) {
      for (int i = 0; i < allCityList.length; i++) {
        String name = allCityList[i].name;

        if (value.length <= name.length) {
          String rawValue = name.substring(0, value.length);
          print("rawValue $rawValue value $value");

          if (rawValue.toLowerCase() == value.toLowerCase()) {
            cityList.add(allCityList[i]);
          }
        } else {
          print("Else");
        }
      }
    } else {
      cityList.addAll(allCityList);
      print(countrylist.length);
    }
  }

}
