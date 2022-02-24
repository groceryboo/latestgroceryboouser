import 'dart:convert';

CreateAddressModel createAddressModelFromJson(String str) => CreateAddressModel.fromJson(json.decode(str));

String createAddressModelToJson(CreateAddressModel data) => json.encode(data.toJson());

class CreateAddressModel {
  CreateAddressModel({
     this.success,
     this.statusCode,
     this.message,
     this.data,
  });

  bool success;
  int statusCode;
  String message;
  Data data;

  factory CreateAddressModel.fromJson(Map<String, dynamic> json) => CreateAddressModel(
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
    this.userId,
     this.firstName,
     this.lastName,
     this.savedName,
     this.landmark,
     this.address,
     this.latitude,
     this.longitude,
     this.streetOne,
     this.streetTwo,
     this.phoneNumber,
     this.instruction,
     this.image,
     this.updatedAt,
     this.createdAt,
     this.id,
  });

  int userId;
  String firstName;
  String lastName;
  String savedName;
  String landmark;
  String address;
  String latitude;
  String longitude;
  String streetOne;
  String streetTwo;
  String phoneNumber;
  String instruction;
  String image;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"]??0,
    firstName: json["first_name"]??"",
    lastName: json["last_name"]??"",
    savedName: json["saved_name"]??"",
    landmark: json["landmark"]??"",
    address: json["address"]??"",
    latitude: json["latitude"]??"",
    longitude: json["longitude"]??"",
    streetOne: json["street_one"]??"",
    streetTwo: json["street_two"]??"",
    phoneNumber: json["phone_number"]??"",
    instruction: json["instruction"]??"",
    image: json["image"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"]??0,
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "first_name": firstName,
    "last_name": lastName,
    "saved_name": savedName,
    "landmark": landmark,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "street_one": streetOne,
    "street_two": streetTwo,
    "phone_number": phoneNumber,
    "instruction": instruction,
    "image": image,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };

}
