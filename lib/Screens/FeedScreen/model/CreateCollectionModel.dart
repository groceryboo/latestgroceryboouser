// To parse this JSON data, do
//
//     final createCollectionModel = createCollectionModelFromJson(jsonString);

import 'dart:convert';

CreateCollectionModel createCollectionModelFromJson(String str) =>
    CreateCollectionModel.fromJson(json.decode(str));

String createCollectionModelToJson(CreateCollectionModel data) =>
    json.encode(data.toJson());

class CreateCollectionModel {
  CreateCollectionModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool success;
  int statusCode;
  String message;
  CreateCollectionDatum data;

  factory CreateCollectionModel.fromJson(Map<String, dynamic> json) =>
      CreateCollectionModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: CreateCollectionDatum.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class CreateCollectionDatum {
  CreateCollectionDatum({
    this.userId,
    this.name,
    this.image,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  int userId;
  String name;
  String image;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory CreateCollectionDatum.fromJson(Map<String, dynamic> json) =>
      CreateCollectionDatum(
        userId: json["user_id"],
        name: json["name"],
        image: json["image"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "image": image,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
