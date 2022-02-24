import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

ProductModel addressModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String ProductModelModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel{
  ProductModel({
     this.success,
     this.statusCode,
     this.message,
     this.data,
  });

  bool success;
  int statusCode;
  String message;
  RxList<Product> data;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    data: RxList<Product>.from(json["data"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Product {
  Product({
     this.id,
     this.name,
     this.image,

  });

  int id;
  String name;
  dynamic image;



  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
