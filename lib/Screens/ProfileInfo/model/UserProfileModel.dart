// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  UserProfileModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool success;
  int statusCode;
  String message;
  Data data;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
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
    this.managerPassword,
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
    this.userPins,
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
  String website;
  dynamic bioData;
  dynamic address;
  dynamic latitude;
  dynamic longitude;
  int status;
  int isConfirm;
  int isVerified;
  int isPushNotification;
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
  List<UserPin> userPins;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    fullName: json["full_name"],
    userName: json["user_name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    password: json["password"],
    managerPassword: json["manager_password"],
    countryCode: json["country_code"],
    phoneNumber: json["phone_number"],
    image: json["image"],
    walletAmount: json["wallet_amount"],
    role: json["role"],
    socialType: json["social_type"],
    socialId: json["social_id"],
    confirmationCode: json["confirmation_code"],
    website: json["website"],
    bioData: json["bio_data"],
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    status: json["status"],
    isConfirm: json["is_confirm"],
    isVerified: json["is_verified"],
    isPushNotification: json["is_push_notification"],
    rememberToken: json["remember_token"],
    parentId: json["parent_id"],
    countryId: json["country_id"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    followerCount: json["follower_count"],
    followingCount: json["following_count"],
    token: json["token"],
    userPins: List<UserPin>.from(json["user_pins"].map((x) => UserPin.fromJson(x))),
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
    "manager_password": managerPassword,
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
    "user_pins": List<dynamic>.from(userPins.map((x) => x.toJson())),
  };
}

class UserPin {
  UserPin({
    this.id,
    this.userId,
    this.cover,
    this.title,
    this.description,
    this.categories,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.pinItems,
  });

  int id;
  int userId;
  String cover;
  String title;
  String description;
  String categories;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<PinItem> pinItems;

  factory UserPin.fromJson(Map<String, dynamic> json) => UserPin(
    id: json["id"],
    userId: json["user_id"],
    cover: json["cover"],
    title: json["title"],
    description: json["description"],
    categories: json["categories"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    pinItems: List<PinItem>.from(json["pin_items"].map((x) => PinItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "cover": cover,
    "title": title,
    "description": description,
    "categories": categories,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "pin_items": List<dynamic>.from(pinItems.map((x) => x.toJson())),
  };
}

class PinItem {
  PinItem({
    this.id,
    this.userId,
    this.productId,
    this.varientId,
    this.varientPrice,
    this.productValue,
    this.pinnedId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int userId;
  int productId;
  int varientId;
  String varientPrice;
  String productValue;
  int pinnedId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory PinItem.fromJson(Map<String, dynamic> json) => PinItem(
    id: json["id"],
    userId: json["user_id"],
    productId: json["product_id"],
    varientId: json["varient_id"],
    varientPrice: json["varient_price"],
    productValue: json["product_value"],
    pinnedId: json["pinned_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "product_id": productId,
    "varient_id": varientId,
    "varient_price": varientPrice,
    "product_value": productValue,
    "pinned_id": pinnedId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
