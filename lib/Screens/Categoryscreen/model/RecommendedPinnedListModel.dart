
import 'dart:convert';

import 'package:get/get.dart';

RecommendedPinnedListModel addressModelFromJson(String str) => RecommendedPinnedListModel.fromJson(json.decode(str));

String ProductModelModelToJson(RecommendedPinnedListModel data) => json.encode(data.toJson());

class RecommendedPinnedListModel{
  RecommendedPinnedListModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool success;
  int statusCode;
  String message;
  RxList<ListOfPinned> data;

  factory RecommendedPinnedListModel.fromJson(Map<String, dynamic> json) => RecommendedPinnedListModel(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    data: RxList<ListOfPinned>.from(json["data"].map((x) => ListOfPinned.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "data": RxList<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ListOfPinned {
  ListOfPinned({
    this.id,
    this.title,
    this.description,
    this.cover,

  });

  int id;
  String title;
  String description;
  dynamic cover;



  factory ListOfPinned.fromJson(Map<String, dynamic> json) => ListOfPinned(
    id: json["id"],
    title: json["title"],
    cover: json["cover"],
    description: json["description"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "cover": cover,
    "description": description,

  };
}

