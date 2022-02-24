import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) => json.encode(data.toJson());

class ForgotPasswordModel {
  ForgotPasswordModel({
     this.success,
     this.statusCode,
     this.message,
     this.data,
  });

  bool success;
  int statusCode;
  String message;
  Data data;

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
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
  });

  int id;
  String firstName;
  String lastName;
  String fullName;
  dynamic userName;
  String email;
  dynamic emailVerifiedAt;
  String password;
  dynamic managerPassword;
  dynamic countryCode;
  String phoneNumber;
  dynamic image;
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
  int isPushNotification;
  dynamic rememberToken;
  int parentId;
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"]??0,
    firstName: json["first_name"]??"",
    lastName: json["last_name"]??"",
    fullName: json["full_name"]??"",
    userName: json["user_name"],
    email: json["email"]??"",
    emailVerifiedAt: json["email_verified_at"],
    password: json["password"]??"",
    managerPassword: json["manager_password"],
    countryCode: json["country_code"],
    phoneNumber: json["phone_number"]??"",
    image: json["image"],
    walletAmount: json["wallet_amount"]??"",
    role: json["role"]??0,
    socialType: json["social_type"],
    socialId: json["social_id"],
    confirmationCode: json["confirmation_code"],
    website: json["website"],
    bioData: json["bio_data"],
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    status: json["status"]??0,
    isConfirm: json["is_confirm"]??0,
    isVerified: json["is_verified"]??0,
    isPushNotification: json["is_push_notification"]??0,
    rememberToken: json["remember_token"],
    parentId: json["parent_id"]??0,
    countryId: json["country_id"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
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
  };
}
