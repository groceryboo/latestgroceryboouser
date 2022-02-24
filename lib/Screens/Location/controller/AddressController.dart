import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Authentication/SignIn/view/signinview.dart';
import 'package:groceryboouser/Screens/Dashboard/view/BottomNavigation.dart';
import 'package:groceryboouser/Screens/Homepage/model/AddressModel.dart';
import 'package:groceryboouser/Screens/Location/model/CreateAddressModel.dart';
import 'package:groceryboouser/Screens/Location/model/ListAddressModel.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:http/http.dart' as http;

class AddressController extends GetxController {

  RxBool boolDisplayEditLayout = false.obs;
  RxBool booladdressList = false.obs;

  String title = "Add to Saved Places";
  RxString strImg = "".obs;
  RxString strProfile = "".obs;
  RxList<ListData> addressList=<ListData>[].obs;

  Rx<TextEditingController> firstNameText = TextEditingController().obs;
  Rx<TextEditingController> lastNameText = TextEditingController().obs;
  Rx<TextEditingController> savedNameAsText = TextEditingController().obs;
  Rx<TextEditingController> landmarkText = TextEditingController().obs;
  Rx<TextEditingController> streetNameText = TextEditingController().obs;
  Rx<TextEditingController> streetName2Text = TextEditingController().obs;
  Rx<TextEditingController> phoneNumText = TextEditingController().obs;
  Rx<TextEditingController> deliveryInstText = TextEditingController().obs;

  /*checking again*/

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init State");
    checkAddressFlow();
  }

  checkAddressFlow() async {
    var preferences = MySharedPref();
    AddressDatum datumModel =
        await preferences.getDatumModel(SharePreData.key_SaveAddressDatumModel);

    if (datumModel != null) {
      boolDisplayEditLayout.value = true;
      title = "Edit Saved Place";
      firstNameText.value.text = datumModel.firstName;
      lastNameText.value.text = datumModel.lastName;
      savedNameAsText.value.text = datumModel.savedName;
      landmarkText.value.text = datumModel.landmark;
      streetNameText.value.text = datumModel.streetOne;
      streetName2Text.value.text = datumModel.streetTwo;
      phoneNumText.value.text = datumModel.phoneNumber;
      deliveryInstText.value.text = datumModel.instruction;

      strProfile.value = datumModel.image.toString();

      SharePreData.strCurrentLocationAddress = datumModel.address;
      SharePreData.strCurrentLatitude = datumModel.latitude;
      SharePreData.strCurrentLongitude = datumModel.longitude;

      strImg.value = datumModel.image;
    } else {
      imagePath = File("");
    }
  }

  createAddressAPI(BuildContext context) async {
    var preferences = MySharedPref();
    String avatar =
    await preferences.getStringValue(SharePreData.key_SelectedAvatar);
    if (avatar.isEmpty) {
      var img =
      await preferences.getStringValue(SharePreData.key_SelectedImgPath);
      printData("Selectd Image Path", img);
      strImg.value = img;
    } else {
      File image = await getImageFileFromAssets(avatar);
      print("Selectd Image Path" + image.toString());
      strImg.value = image.path;
    }
    if(strImg.value.toString().isEmpty){
      snackBar(context, "Add Image");
      return;
    }

    SigninModel myModel =
        await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel.data.token;

    if(token==null){
      Get.offAll(SignIn());
    }

    onLoading(context, "Loading..");

    String url = urlBase + urlAddressCreate;
    dynamic body = {
      'first_name': firstNameText.value.text,
      'last_name': lastNameText.value.text,
      'saved_name_as': savedNameAsText.value.text,
      'landmark': landmarkText.value.text,
      'address': SharePreData.strCurrentLocationAddress,
      'latitude': SharePreData.strCurrentLatitude,
      'longitude': SharePreData.strCurrentLongitude,
      'street_name': streetNameText.value.text,
      'street_name_two': streetName2Text.value.text,
      'phone_number': phoneNumText.value.text,
      'delivery_instruction': deliveryInstText.value.text

    };

    final apiReq = Request();
    await apiReq.postAPIWithMedia(url, body, token, strImg.value).then((value) async {
      http.StreamedResponse res = value;

      printData("Create Address status", res.statusCode.toString());

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          print("create address status " + model.statusCode.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();
            printData("Create Address ", "Token Updated");
            createAddressAPI(context);
          } else if (model.statusCode == 200) {
            CreateAddressModel addressModel =
                CreateAddressModel.fromJson(userModel);

            Navigator.pop(context); //pop dialog
            await snackBar(context, addressModel.message);
            Get.back();
          } else {
            Navigator.pop(context);
            snackBar(context, model.message);
          }
        });
      } else {
        Navigator.pop(context); //pop dialog
        print(res.reasonPhrase);
      }
    });
  }

  listAddressAPI(BuildContext context) async {
    var preferences = MySharedPref();
    //User Personal details
    SigninModel myModel =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel?.data.token;

    String url = urlBase + urlAddressesList;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token).then((value) {
      http.StreamedResponse res = value;


      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("Address List API response message" , model.message.toString());

          if(model.statusCode ==500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

          }else if(model.statusCode==200){
            ListAddressModel addressModel = ListAddressModel.fromJson(userModel);
            addressList = addressModel.listData;


            printData("Address list", addressList.toString());
            printData("Address list length", addressList.length.toString());

            if(addressList.length>0){
              booladdressList.value = true;
            }else{
              booladdressList.value = false;
            }

            //printData("Address list", boolDisplayAddresses.toString());
          }

        });
      }else{
        print(res.reasonPhrase);
      }

    });

  }

  editAddressAPI(BuildContext context) async {
    var preferences = MySharedPref();

    //Edit address model
    AddressDatum datumModel =
    await preferences.getDatumModel(SharePreData.key_SaveAddressDatumModel);
    String addressId = datumModel.id.toString();
    String avatar =
    await preferences.getStringValue(SharePreData.key_SelectedAvatar);
    if (avatar.isEmpty) {
      var img =
      await preferences.getStringValue(SharePreData.key_SelectedImgPath);

      printData("Address Path", img);
      strImg.value = img;
    } else {
      File image = await getImageFileFromAssets(avatar);
      print("Selectd Image Path" + image.toString());
      strImg.value = image.path;
    }

    if(strImg.value.toString().isEmpty){
      snackBar(context, "Add Image");
      return;
    }

    SigninModel myModel =
        await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel.data.token;

    if(token==null){
      Get.offAll(SignIn());
    }
    onLoading(context, "Updating..");

    String url = urlBase + urlAddressEdit;
    dynamic body = {
      'address_id': addressId,
      'first_name': firstNameText.value.text,
      'last_name': lastNameText.value.text,
      'saved_name_as': savedNameAsText.value.text,
      'landmark': landmarkText.value.text,
      'address': SharePreData.strCurrentLocationAddress,
      'latitude': SharePreData.strCurrentLatitude,
      'longitude': SharePreData.strCurrentLongitude,
      'street_name': streetNameText.value.text,
      'street_name_two': streetName2Text.value.text,
      'phone_number': phoneNumText.value.text,
      'delivery_instruction': deliveryInstText.value.text
    };

    final apiReq = Request();
    await apiReq.postAPIWithMedia(url, body, token, strImg.value).then((value) async {
      http.StreamedResponse res = value;
      printData("Edit address status", res.statusCode.toString());

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);
          printData("Edit address status", model.statusCode.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();
            printData("Edit address", "Token Updated");
            createAddressAPI(context);
          } else if (model.statusCode == 200) {
            CreateAddressModel addressModel =
                CreateAddressModel.fromJson(userModel);

            Navigator.pop(context); //pop dialog
            await snackBar(context, addressModel.message);

            Get.back();
          } else {
            Navigator.pop(context);
            snackBar(context, model.message);
          }
        });
      } else {
        Navigator.pop(context); //pop dialog
        print(res.reasonPhrase);
      }
    });
  }

  deleteAddressAPI(BuildContext context) async {
    onLoading(context, "Deleting..");
    var preferences = MySharedPref();
    //User Personal details
    SigninModel myModel =
        await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    var token = myModel.data.token;

    //address model
    AddressDatum datumModel =
        await preferences.getDatumModel(SharePreData.key_SaveAddressDatumModel);

    String addressId = datumModel.id.toString();
    String url = urlBase + urlAddressDelete;
    dynamic body = {'address_id': addressId};

    printData("Delete address body", body.toString());

    final apiReq = Request();
    await apiReq.postAPI(url, body, token).then((value) {
      http.StreamedResponse res = value;

      printData("Delete address body", res.statusCode.toString());

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("Delete address staus",  model.statusCode.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            deleteAddressAPI(context);
          } else if (model.statusCode == 200) {
            preferences.clear(SharePreData.key_SaveAddressDatumModel);
            snackBar(context, model.message);
            Navigator.pop(context); //pop dialog

            print("Output " + model.message.toString());

            Get.off(() => BottomNavigation());
          }
        });
      } else {
        Navigator.pop(context);
      }
    });
  }

}
