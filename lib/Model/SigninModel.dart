
import 'package:meta/meta.dart';
import 'dart:convert';

SigninModel signinModelFromJson(String str) => SigninModel.fromJson(json.decode(str));

String signinModelToJson(SigninModel data) => json.encode(data.toJson());

class SigninModel {
  SigninModel({
     this.statusCode,
     this.success,
     this.message,
     this.data,
  });

  bool success;
  int statusCode;
  String message;
  Data data;

  factory SigninModel.fromJson(Map<String, dynamic> json) => SigninModel(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
     this.id,
     this.firstName,
     this.lastName,
     this.fullName,
     this.userName,
     this.email,
     this.emailVerifiedAt,
     this.password,
     this.countryCode,
     this.phoneNumber,
     this.image,
     this.walletAmount,
     this.role,
     this.socialType,
     this.socialId,
     this.confirmationCode,
     this.website,
     this.bioData,
     this.address,
     this.latitude,
     this.longitude,
     this.status,
     this.isConfirm,
     this.isVerified,
     this.isPushNotification,
     this.rememberToken,
     this.parentId,
     this.countryId,
     this.stateId,
     this.cityId,
     this.createdAt,
     this.updatedAt,
     this.deletedAt,
     this.followerCount,
     this.followingCount,
     this.token,
  });

  int id;
  String firstName;
  String lastName;
  String fullName;
  String userName;
  String email;
  dynamic emailVerifiedAt;
  String password;
  dynamic managerPassword;
  dynamic countryCode;
  String phoneNumber;
  String image;
  String walletAmount;
  int role;
  dynamic socialType;
  dynamic socialId;
  dynamic confirmationCode;
  dynamic website;
  dynamic bioData;
  dynamic address;
  dynamic latitude;
  dynamic longitude;
  int status;
  int isConfirm;
  int isVerified;
  dynamic isPushNotification;
  dynamic rememberToken;
  int parentId;
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int followerCount;
  int followingCount;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"]??0,
    firstName: json["first_name"]??"",
    lastName: json["last_name"]??"",
    fullName: json["full_name"]??"",
    userName: json["user_name"]??"",
    email: json["email"]??"",
    emailVerifiedAt: json["email_verified_at"]??"",
    password: json["password"]??"",
    countryCode: json["country_code"]??"",
    phoneNumber: json["phone_number"]??"",
    image: json["image"]??"",
    walletAmount: json["wallet_amount"]??"",
    role: json["role"]??0,
    socialType: json["social_type"]??"",
    socialId: json["social_id"]??"",
    confirmationCode: json["confirmation_code"]??"",
    website: json["website"]??"",
    bioData: json["bio_data"]??"",
    address: json["address"]??"",
    latitude: json["latitude"]??"",
    longitude: json["longitude"]??"",
    status: json["status"]??0,
    isConfirm: json["is_confirm"]??0,
    isVerified: json["is_verified"]??0,
    isPushNotification: json["is_push_notification"],
    rememberToken: json["remember_token"]??"",
    parentId: json["parent_id"]??0,
    countryId: json["country_id"]??0,
    stateId: json["state_id"]??0,
    cityId: json["city_id"]??0,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"]??"",
    followerCount: json["follower_count"]??0,
    followingCount: json["following_count"]??0,
    token: json["token"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "full_name": fullName,
    "user_name": userName,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "password": password,
    "country_code": countryCode,
    "phone_number": phoneNumber,
    "image": image,
    "wallet_amount": walletAmount,
    "role": role,
    "social_type": socialType,
    "social_id": socialId,
    "confirmation_code": confirmationCode,
    "website": website,
    "bio_data": bioData,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "status": status,
    "is_confirm": isConfirm,
    "is_verified": isVerified,
    "is_push_notification": isPushNotification,
    "remember_token": rememberToken,
    "parent_id": parentId,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "follower_count": followerCount,
    "following_count": followingCount,
    "token": token,
  };

}