
import 'dart:convert';

import 'package:get/get.dart';

ProductModelWithVeriantimport addressModelFromJson(String str) =>
    ProductModelWithVeriantimport.fromJson(json.decode(str));

String CategoryModelToJson(ProductModelWithVeriantimport data) => json.encode(data.toJson());

class ProductModelWithVeriantimport {
  ProductModelWithVeriantimport({
     this.success,
     this.statusCode,
     this.message,
     this.data,
  });

  bool success;
  int statusCode;
  String message;
  RxList<ProductModelWithVeriantimportCategory> data;

  factory ProductModelWithVeriantimport.fromJson(Map<String, dynamic> json) => ProductModelWithVeriantimport(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    data: RxList<ProductModelWithVeriantimportCategory>.from(json["data"].map((x) => ProductModelWithVeriantimportCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProductModelWithVeriantimportCategory {
  ProductModelWithVeriantimportCategory({
     this.id,
     this.name,
     this.description,
     this.image,
     this.varientsList,
  });

  int id;
  String name;
  String description;
  dynamic image;
  List<Varients> varientsList;
  // List<Varients> varients;
  // List<Category_details> category_details;
  // List<Vendor_details> vendor_details;

  factory ProductModelWithVeriantimportCategory.fromJson(Map<dynamic, dynamic> json) => ProductModelWithVeriantimportCategory(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
    varientsList: List<Varients>.from(json["varients"].map((x) => Varients.fromJson(x))),
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

class Category_details {
  Category_details({
     this.id,
     this.user_id,
     this.parent_category_id,
     this.name,
     this.image,
     this.status,
  });

  int id;
  int user_id;
  int parent_category_id;
  String name;
  dynamic image;
  int status;

  factory Category_details.fromJson(Map<String, dynamic> json) =>
      Category_details(
        id: json["id"],
        user_id: json["user_id"],
        parent_category_id: json["parent_category_id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": user_id,
    "parent_category_id": parent_category_id,
    "name": name,
    "image": image,
    "status": status,
  };
}

class Vendor_details {
  Vendor_details({
     this.id,
     this.full_name,
     this.user_name,
     this.email,
     this.image,
  });

  int id;
  String full_name;
  String user_name;
  String email;
  dynamic image;

  factory Vendor_details.fromJson(Map<String, dynamic> json) => Vendor_details(
    id: json["id"],
    full_name: json["full_name"],
    user_name: json["user_name"],
    email: json["email"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": full_name,
    "user_name": user_name,
    "email": email,
    "image": image,
  };
}