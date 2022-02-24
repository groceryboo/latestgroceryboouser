import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
     this.success,
     this.statusCode,
     this.message,
     this.data,
  });

  bool success;
  int statusCode;
  String message;
  RxList<AddressDatum> data;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    data: RxList<AddressDatum>.from(json["data"].map((x) => AddressDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AddressDatum {
  AddressDatum({
     this.id,
     this.userId,
     this.image,
     this.firstName,
     this.lastName,
     this.savedName,
     this.landmark,
     this.address,
     this.streetOne,
     this.streetTwo,
     this.phoneNumber,
     this.instruction,
     this.latitude,
     this.longitude,
     this.isDefault,
     this.createdAt,
     this.updatedAt,
     this.deletedAt,
  });

  int id;
  int userId;
  dynamic image;
  String firstName;
  String lastName;
  String savedName;
  String landmark;
  String address;
  String streetOne;
  String streetTwo;
  String phoneNumber;
  String instruction;
  String latitude;
  String longitude;
  String isDefault;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory AddressDatum.fromJson(Map<String, dynamic> json) => AddressDatum(
    id: json["id"],
    userId: json["user_id"],
    image: json["image"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    savedName: json["saved_name"],
    landmark: json["landmark"],
    address: json["address"],
    streetOne: json["street_one"],
    streetTwo: json["street_two"],
    phoneNumber: json["phone_number"],
    instruction: json["instruction"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    isDefault: json["is_default"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "image": image,
    "first_name": firstName,
    "last_name": lastName,
    "saved_name": savedName,
    "landmark": landmark,
    "address": address,
    "street_one": streetOne,
    "street_two": streetTwo,
    "phone_number": phoneNumber,
    "instruction": instruction,
    "latitude": latitude,
    "longitude": longitude,
    "is_default": isDefault,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
