// To parse this JSON data, do
//
//     final collectionListModel = collectionListModelFromJson(jsonString);

import 'dart:convert';

CollectionListModel collectionListModelFromJson(String str) =>
    CollectionListModel.fromJson(json.decode(str));

String collectionListModelToJson(CollectionListModel data) =>
    json.encode(data.toJson());

class CollectionListModel {
  CollectionListModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool success;
  int statusCode;
  String message;
  List<CollectionDatum> data;

  factory CollectionListModel.fromJson(Map<String, dynamic> json) =>
      CollectionListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<CollectionDatum>.from(
            json["data"].map((x) => CollectionDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CollectionDatum {
  CollectionDatum({
    this.id,
    this.userId,
    this.image,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int userId;
  String image;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;

  factory CollectionDatum.fromJson(Map<String, dynamic> json) =>
      CollectionDatum(
        id: json["id"],
        userId: json["user_id"],
        image: json["image"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: DateTime.parse(json["deleted_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image": image,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt.toIso8601String(),
      };
}
