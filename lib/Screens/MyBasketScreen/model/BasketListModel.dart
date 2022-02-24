import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

BasketListModel addressModelFromJson(String str) =>
    BasketListModel.fromJson(json.decode(str));

String CategoryModelToJson(BasketListModel data) => json.encode(data.toJson());

class BasketListModel {
  BasketListModel({
     this.success,
     this.statusCode,
     this.message,
     this.data,
  });

  bool success;
  int statusCode;
  String message;
  RxList<ProductDetailsModel> data;

  factory BasketListModel.fromJson(Map<String, dynamic> json) => BasketListModel(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    data: RxList<ProductDetailsModel>.from(json["data"].map((x) => ProductDetailsModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProductDetailsModel {
  ProductDetailsModel({
     this.id,
     this.product_id,
     this.name,
     this.description,
     this.image,
     this.varientsList,
  });

  int id;
  int product_id;
  String name;
  String description;
  dynamic image;
  RxList<Varients> varientsList;
  // List<Varients> varients;
  // List<Category_details> category_details;
  // List<Vendor_details> vendor_details;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    id: json["id"],
    product_id: json['product_details']["id"],
    name: json['product_details']["name"],
    image: json['product_details']["image"],
    description: json['product_details']["description"],
    varientsList: RxList<Varients>.from(json["product_details"]["varients"].map((x) => Varients.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    // "varients": List<dynamic>.from(varients.map((x) => x.toJson())),
    // "category_details": List<dynamic>.from(varients.map((x) => x.toJson())),
  };
}

class Varients {
  Varients({
     this.id,
     this.user_id,
     this.product_id,
     this.unit,
     this.cost,
     this.discount_price,
     this.sku,
     this.stock,
     this.status,
    this.isAdded=false,
    this.count=0
  });

  int id;
  int user_id;
  int product_id;
  String unit;
  String cost;
  String discount_price;
  String sku;
  String stock;
  int status;
  bool isAdded;
  int count;

  factory Varients.fromJson(Map<String, dynamic> json) => Varients(
    id: json["id"],
    user_id: json["user_id"],
    product_id: json["product_id"],
    unit: json["unit"],
    cost: json["cost"],
    discount_price: json["discount_price"],
    sku: json["sku"],
    stock: json["stock"],
    status: json["status"],
    // isAdded: json["isAdded"],
    // count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": user_id,
    "product_id": product_id,
    "unit": unit,
    "cost": cost,
    "discount_price": discount_price,
    "sku": sku,
    "stock": stock,
    "status": status,
  };
}
