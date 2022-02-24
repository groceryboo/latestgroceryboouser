import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Homepage/model/AddressModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Created by Vrusti Patel

Future setuplocator() async {
  GetIt locator = GetIt.instance;
  var instance = await MySharedPref.getInstance();
  locator.registerSingleton<MySharedPref>(instance);
}

class MySharedPref {
  static MySharedPref classInstance;
  static SharedPreferences preferences;

  static Future<MySharedPref> getInstance() async {
    classInstance ??= MySharedPref();
    preferences ??= await SharedPreferences.getInstance();
    return classInstance;
  }

  _getFromDisk(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.get(key);
    print("Value Model got... .... " + value.toString());
    return value;
  }

  Future<void> setString(String key, String content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Value Set ::::::" + content);
    prefs.setString(key, content);
  }

  Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Value set ::::::" + value.toString());
    prefs.setBool(key, value);
  }

  getStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString(key) ?? "";
    print("Value set ::::::" + stringValue);
    return stringValue;
  }

  getBoolValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    bool boolVal = prefs.getBool(key);
    print("Value get ::::::" + boolVal.toString());
    return boolVal;
  }

  // It clears preference data by unique key name
  Future<void> clear(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  // Used to save user's information
  setSignInModel(SigninModel model, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Value set model ::::::" + model.data.id.toString());
    prefs.setString(key, json.encode(model.toJson()));
  }

  // Used to get user's information
  Future<SigninModel> getSignInModel(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var myJson = prefs.getString(key);
    if (myJson == null) {
      return null;
    }
    return SigninModel.fromJson(json.decode(myJson));
  }

  // Used to set user's address
  setAddressDatumModel(AddressDatum model, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Value set model :::::::" + model.id.toString());
    prefs.setString(key, json.encode(model.toJson()));

  }

  // Used to get user's address
  Future<AddressDatum> getDatumModel(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var myJson = prefs.getString(key);
    if (myJson == null) {
      return null;
    }
    return AddressDatum.fromJson(json.decode(myJson));
  }


}
