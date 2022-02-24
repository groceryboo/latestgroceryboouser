
import 'package:get/get.dart';

class PinnedDetailsModel {
  bool success;
  int statusCode;
  String message;
  RxList<PinnedDetailsData> data;

  PinnedDetailsModel({this.success, this.statusCode, this.message, this.data});

  PinnedDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data= RxList<PinnedDetailsData>.from(json["data"].map((x) => PinnedDetailsData.fromJson(x)));
  }

}

class PinnedDetailsData {
  int id;
  int userId;
  String cover;
  String title;
  String description;
  String categories;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  String  fullName;
  String  userImage;
  RxList<PinItems> pinItems;

  PinnedDetailsData(
      {this.id,
        this.userId,
        this.cover,
        this.title,
        this.description,
        this.categories,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,this.fullName,this.userImage,
        this.pinItems});

  PinnedDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    cover = json['cover'];
    title = json['title'];
    description = json['description'];
    categories = json['categories'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    fullName = json['user_details']['first_name'];
    userImage = json['user_details']['image'];
    pinItems= RxList<PinItems>.from(json["pin_items"].map((x) => PinItems.fromJson(x)));
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['user_id'] = this.userId;
  //   data['cover'] = this.cover;
  //   data['title'] = this.title;
  //   data['description'] = this.description;
  //   data['categories'] = this.categories;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   data['deleted_at'] = this.deletedAt;
  //   if (this.userDetails != null) {
  //     data['user_details'] = this.userDetails.toJson();
  //   }
  //   if (this.pinItems != null) {
  //     data['pin_items'] = this.pinItems.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}


class PinItems {
  int id;
  int userId;
  int productId;
  int varientId;
  String varientPrice;
  String productValue;
  int pinnedId;
  String createdAt;
  String updatedAt;
  String productName;
  String productImage;
  String varientUnit;
  String varientCost;
  Null deletedAt;
  // ProductItems productItems;
  // VarientItems varientItems;

  PinItems(
      {this.id,
        this.userId,
        this.productId,
        this.varientId,
        this.varientPrice,
        this.productValue,
        this.pinnedId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,this.productImage,this.productName,this.varientCost,this.varientUnit
        });

  PinItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    varientId = json['varient_id'];
    varientPrice = json['varient_price'];
    productValue = json['product_value'];
    pinnedId = json['pinned_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    productImage = json['product_items']['image'];
    productName = json['product_items']['name'];
    varientUnit = json['varient_items']['unit'];
    varientCost = json['varient_items']['cost'];

  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['user_id'] = this.userId;
  //   data['product_id'] = this.productId;
  //   data['varient_id'] = this.varientId;
  //   data['varient_price'] = this.varientPrice;
  //   data['product_value'] = this.productValue;
  //   data['pinned_id'] = this.pinnedId;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   data['deleted_at'] = this.deletedAt;
  //   if (this.productItems != null) {
  //     data['product_items'] = this.productItems.toJson();
  //   }
  //   if (this.varientItems != null) {
  //     data['varient_items'] = this.varientItems.toJson();
  //   }
  //   return data;
  // }
}
//
// class ProductItems {
//   int id;
//   int userId;
//   int categoryId;
//   String name;
//   String description;
//   int isVarients;
//   String tags;
//   String image;
//   int status;
//   String replacementProduct;
//   int isRecommonded;
//   String createdAt;
//   String updatedAt;
//   Null deletedAt;
//
//   ProductItems(
//       {this.id,
//         this.userId,
//         this.categoryId,
//         this.name,
//         this.description,
//         this.isVarients,
//         this.tags,
//         this.image,
//         this.status,
//         this.replacementProduct,
//         this.isRecommonded,
//         this.createdAt,
//         this.updatedAt,
//         this.deletedAt});
//
//   ProductItems.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     categoryId = json['category_id'];
//     name = json['name'];
//     description = json['description'];
//     isVarients = json['is_varients'];
//     tags = json['tags'];
//     image = json['image'];
//     status = json['status'];
//     replacementProduct = json['replacement_product'];
//     isRecommonded = json['is_recommonded'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['category_id'] = this.categoryId;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['is_varients'] = this.isVarients;
//     data['tags'] = this.tags;
//     data['image'] = this.image;
//     data['status'] = this.status;
//     data['replacement_product'] = this.replacementProduct;
//     data['is_recommonded'] = this.isRecommonded;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['deleted_at'] = this.deletedAt;
//     return data;
//   }
// }
//
// class VarientItems {
//   int id;
//   int userId;
//   int productId;
//   String unit;
//   String cost;
//   String discountPrice;
//   String sku;
//   String stock;
//   int status;
//   String createdAt;
//   String updatedAt;
//   Null deletedAt;
//
//   VarientItems(
//       {this.id,
//         this.userId,
//         this.productId,
//         this.unit,
//         this.cost,
//         this.discountPrice,
//         this.sku,
//         this.stock,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//         this.deletedAt});
//
//   VarientItems.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     productId = json['product_id'];
//     unit = json['unit'];
//     cost = json['cost'];
//     discountPrice = json['discount_price'];
//     sku = json['sku'];
//     stock = json['stock'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['product_id'] = this.productId;
//     data['unit'] = this.unit;
//     data['cost'] = this.cost;
//     data['discount_price'] = this.discountPrice;
//     data['sku'] = this.sku;
//     data['stock'] = this.stock;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['deleted_at'] = this.deletedAt;
//     return data;
//   }
// }