import 'package:flutter/material.dart';

class CategoryModelStatic {
  bool success;
  int statusCode;
  String message;
  List<FruitListCat> fruitdata;

  CategoryModelStatic(
      { this.success,
       this.statusCode,
       this.message,
       this.fruitdata});

  factory CategoryModelStatic.fromJson(Map<String, dynamic> json) =>
      CategoryModelStatic(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        fruitdata: List<FruitListCat>.from(
            json["data"].map((x) => FruitListCat.fromJson(x))),
      );
}

class FruitListCat {
  FruitListCat({
     this.id,
     this.name,
     this.image,
  });

  int id;
  String name;
  dynamic image;

  factory FruitListCat.fromJson(Map<String, dynamic> json) => FruitListCat(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

List<CategoryModelStatic> modelArrayList = [];
