import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Screens/ProfileInfo/model/UserProfileModel.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:http/http.dart' as http;

class UserMyProfileController extends GetxController {

  var preferences = MySharedPref();

  // Rx<TextEditingController> userNameText = TextEditingController().obs;
  // Rx<TextEditingController> fullNameText = TextEditingController().obs;
  // Rx<TextEditingController> followersText = TextEditingController().obs;
  // Rx<TextEditingController> followingText = TextEditingController().obs;
  // Rx<TextEditingController> bioText = TextEditingController().obs;
  // Rx<TextEditingController> websiteText = TextEditingController().obs;

  RxString strImage = "".obs;
  RxString token = "".obs;
  RxString userNameText = "".obs;
  RxString fullNameText = "".obs;
  RxString followersText = "".obs;
  RxString followingText = "".obs;
  RxString bioText = "".obs;
  RxString websiteText = "".obs;

  Rx<SigninModel> profileModel= SigninModel().obs;
  RxList<dynamic> userPinsList =<dynamic>[].obs ;

  //Edit Profile
  Rx<TextEditingController> editNameText = TextEditingController().obs;
  Rx<TextEditingController> editUserNameText = TextEditingController().obs;
  Rx<TextEditingController> editWebsiteText = TextEditingController().obs;
  Rx<TextEditingController> editBioText = TextEditingController().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // TODO: implement onInit
    print("init State");

    await userInfoModel();
    userProfileAPI();
  }

  userProfileAPI() async {
    String url = urlBase + urlPostUserProfile;

    final apiReq = Request();
    await apiReq.postAPI(url, null, token.value).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("User Profile message", model.message.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            userProfileAPI();
          }
          else if (model.statusCode == 200) {
            UserProfileModel userProfile =
            UserProfileModel.fromJson(userModel);

            userPinsList.value = userProfile.data.userPins;

            print("Pins list :"+ userPinsList.toString());
            print("Pins list :"+ userPinsList.length.toString());

            SigninModel userInfo =
            SigninModel.fromJson(userModel);

            await preferences.setSignInModel(userInfo, SharePreData.key_SaveSignInModel);
            userInfoModel();

            // snackBar(context, profileModel.message);
            // Navigator.pop(context); //pop dialog
          } else {
            printData("User Profile status", model.statusCode.toString());
            // Navigator.pop(context); //pop dialog
            // await snackBar(context, model.message);
          }
        });
      } else {
        print(res.reasonPhrase);
        // Navigator.pop(context); //pop dialog
      }
    });
  }

  userInfoModel() async {
    print("First Call");

    //User Personal details
    profileModel.value =
    await preferences.getSignInModel(SharePreData.key_SaveSignInModel);

    // userNameText.value.text =  profileModel.value.data.userName;
    // fullNameText.value.text = profileModel.value.data.fullName;
    // followersText.value.text = profileModel.value.data.followerCount.toString();
    // followingText.value.text = profileModel.value.data.followingCount.toString();
    // bioText.value.text = profileModel.value.data.bioData;
    // websiteText.value.text = profileModel.value.data.website;

    userNameText.value =  profileModel.value.data.userName;
    fullNameText.value = profileModel.value.data.fullName;
    followersText.value = profileModel.value.data.followerCount.toString();
    followingText.value = profileModel.value.data.followingCount.toString();
    bioText.value = profileModel.value.data.bioData;
    websiteText.value = profileModel.value.data.website;

    print("Model  Username :: " + profileModel.value.data.userName);
    print("String Username :: " + userNameText.value);

    editNameText.value.text = profileModel.value.data.firstName;
    editUserNameText.value.text = profileModel.value.data.userName;
    editWebsiteText.value.text = profileModel.value.data.website;
    editBioText.value.text = profileModel.value.data.bioData;

    print("TextEditor username :: " +userNameText.value);

    strImage.value = profileModel.value.data.image;
    token.value = profileModel.value.data.token;

   }

  editUserProfileAPI(BuildContext context) async {
    onLoading(context, "Updating..");

    String url = urlBase + urlPostEditUserProfile;

    dynamic body = {
      'first_name': editNameText.value.text,
      'user_name': editUserNameText.value.text,
      'website': editWebsiteText.value.text,
      'bio_data': editBioText.value.text,
    };

    final apiReq = Request();
    await apiReq.postAPI(url, body, token.value).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("Edit Profile message", model.message.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            editUserProfileAPI(context);
          } else if (model.statusCode == 200) {
            SigninModel loginM = SigninModel.fromJson(userModel);
            printData("Edit user message", model.message.toString());

            profileModel.value.data.firstName = editNameText.value.text;
            profileModel.value.data.userName = editUserNameText.value.text;
            profileModel.value.data.website = editWebsiteText.value.text;
            profileModel.value.data.bioData = editBioText.value.text;
            profileModel.value.data.image = loginM.data.image;

            // userNameText.value.text = profileModel.value.data.userName;
            // fullNameText.value.text = profileModel.value.data.fullName;
            // followersText.value.text = profileModel.value.data.followerCount.toString();
            // followingText.value.text = profileModel.value.data.followingCount.toString();
            // bioText.value.text = profileModel.value.data.bioData;
            // websiteText.value.text = profileModel.value.data.website;

            userNameText.value = profileModel.value.data.userName;
            fullNameText.value = profileModel.value.data.fullName;
            followersText.value = profileModel.value.data.followerCount.toString();
            followingText.value = profileModel.value.data.followingCount.toString();
            bioText.value = profileModel.value.data.bioData;
            websiteText.value = profileModel.value.data.website;

            await preferences.setSignInModel(profileModel.value, SharePreData.key_SaveSignInModel);

            // userInfoModel();

            snackBar(context, loginM.message);
            Navigator.pop(context); //pop dialog
            Get.back();

          } else {
            printData("User Profile status", model.statusCode.toString());
            Navigator.pop(context); //pop dialog
            await snackBar(context, model.message);
          }

        });
      } else {
        print(res.reasonPhrase);
        Navigator.pop(context); //pop dialog
      }

    });
  }

}
