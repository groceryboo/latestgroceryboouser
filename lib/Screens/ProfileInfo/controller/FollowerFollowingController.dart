import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BaseModel.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
import 'package:groceryboouser/Screens/Networks/api_response.dart';
import 'package:groceryboouser/Screens/Networks/token_update_request.dart';
import 'package:groceryboouser/Screens/ProfileInfo/model/FollowingListModel.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:http/http.dart' as http;

class FollowerFollowingController extends GetxController {

  var preferences = MySharedPref();

  RxString token = "".obs;
  RxString strFollowers = "".obs;
  RxString strFollowing = "".obs;

  Rx<SigninModel> profileModel = SigninModel().obs;

  RxList<FollowDatum> followersList = <FollowDatum>[].obs;
  RxList<FollowDatum> followingList = <FollowDatum>[].obs;

  Rx<TextEditingController> searchCountryText = TextEditingController().obs;
  Rx<TextEditingController> searchCityText = TextEditingController().obs;
  List<FollowDatum> allCityList = [];

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    print("init State");

    await userProfileInfo();
    followersListAPI();
    followingListAPI();
  }

  followersListAPI() async {
    printData("Followers List msg", token.value);

    String url = urlBase + urlPostFollowerList;

    final apiReq = Request();
    await apiReq.postAPI(url, null, token.value).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("Followers List msg", model.message.toString());
          printData("Followers List status", model.statusCode.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            followersListAPI();
          } else if (model.statusCode == 200) {
            FollowListModel followersModel =
                FollowListModel.fromJson(userModel);
            followersList.value = followersModel.data;

            printData(
                "Followers List status", followersModel.message.toString());

            // print("Following List Model FirstName " + followingModel.firstName);

            // snackBar(context, profileModel.message);
            // Navigator.pop(context); //pop dialog

          } else {
            printData("Followers List status", model.statusCode.toString());

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

  followingListAPI() async {
    printData("Following List msg", token.value);

    String url = urlBase + urlPostFollowingList;

    final apiReq = Request();
    await apiReq.postAPI(url, null, token.value).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("Following List msg", model.message.toString());
          printData("Following List status", model.statusCode.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            followersListAPI();
          } else if (model.statusCode == 200) {
            FollowListModel followersModel =
                FollowListModel.fromJson(userModel);
            followingList.value = followersModel.data;

// storing all the cities
//             allCityList.addAll(followersModel.data);
// // storing cities to display.
//             followingList.value.addAll(allCityList);

            printData("CountryList Model ",  followingList.value.toString());

            printData(
                "Following List status", followersModel.message.toString());

          } else {
            printData("Following List status", model.statusCode.toString());
          }

        });
      } else {
        print(res.reasonPhrase);

      }
    });
  }

  unfollowUserAPI(String userid, BuildContext context) async {
    printData("Unfollow user", token.value);
    String url = urlBase + urlPostUnfollowUser;

    dynamic body = {
      'user_id': userid
    };

    final apiReq = Request();
    await apiReq.postAPI(url, body, token.value).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("unfollow msg", model.message.toString());
          printData("unfollow status", model.statusCode.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            unfollowUserAPI(userid,context);
          } else if (model.statusCode == 200) {
            snackBar(context, model.message);

          } else {
            printData("unfollow List status", model.statusCode.toString());
            await snackBar(context, model.message);
          }
        });
      }
      else {
        print(res.reasonPhrase);
      }

    });
  }

  followUserAPI(String userid, BuildContext context) async {
    printData("Unfollow user", token.value);
    String url = urlBase + urlPostFollowUser;

    dynamic body = {
      'user_id': userid
    };

    final apiReq = Request();
    await apiReq.postAPI(url, body, token.value).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          printData("follow msg", model.message.toString());
          printData("follow status", model.statusCode.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            unfollowUserAPI(userid,context);
          } else if (model.statusCode == 200) {
            snackBar(context, model.message);

          } else {
            printData("follow List status", model.statusCode.toString());
            await snackBar(context, model.message);
          }
        });
      }
      else {
        print(res.reasonPhrase);
      }

    });
  }

  Future<void> clearFollowingList() async {
    if (searchCityText.value.text.isNotEmpty) {
      searchCityText.value.text = "";
      followingList.clear();
      followingList.addAll(allCityList);
    }
  }

  Future<void> filterCityList(String value) async {
    print(" value $value");

    //clearning the list before adding filtered list data
    followingList.value.clear();

    // checking the searched keyword
    if (value.isNotEmpty) {
      for (int i = 0; i < allCityList.length; i++) {
        String name = allCityList[i].firstName;

        if (value.length <= name.length) {
          String rawValue = name.substring(0, value.length);
          print("rawValue $rawValue value $value");

          if (rawValue.toLowerCase() == value.toLowerCase()) {
            followingList.value.add(allCityList[i]);
          }
        } else {
          print("Else");
        }
      }
    } else {
      followingList.value.addAll(allCityList);
      // print(countrylist.length);
    }
  }

  userProfileInfo() async {
    profileModel.value =
        await preferences.getSignInModel(SharePreData.key_SaveSignInModel);

    strFollowers.value = profileModel.value.data.followerCount.toString();
    strFollowing.value = profileModel.value.data.followingCount.toString();

    token.value = profileModel.value.data.token;
  }

}
