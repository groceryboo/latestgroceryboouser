

import 'dart:convert';
class PinnedGridModel {

  final String image;
  final String title;
  final String quantity;
  final String price;

  PinnedGridModel(this.image,this.title,this.quantity,this.price);
}
List<PinnedGridModel>modelArrayList = [];




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