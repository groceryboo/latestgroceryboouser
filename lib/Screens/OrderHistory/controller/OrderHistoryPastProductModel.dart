
import 'package:get/get.dart';

class OrderHistoryPastProductModel {
  bool success;
  int statusCode;
  String message;
  DataOfPastOrder dataOfOrder;

  OrderHistoryPastProductModel({ this.success, this.statusCode, this.message, this.dataOfOrder});

  factory OrderHistoryPastProductModel.fromJson(Map<String, dynamic> json) => OrderHistoryPastProductModel(
      success: json["success"],
      statusCode: json["status_code"],
      message: json["message"],
      dataOfOrder: json["data"]
  );


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;

    // data['data'] = this.data.toJson();

    return data;
  }
}

class DataOfPastOrder {
  //int orderCount;
  RxList<PastOrderList> pastOrderList;
  DataOfPastOrder({ this.pastOrderList});
  factory DataOfPastOrder.fromJson(Map<dynamic, dynamic> json) =>DataOfPastOrder(
    //orderCount : int.parse(json['order_count']),
    pastOrderList: RxList<PastOrderList>.from(json['data']["past_order_list"].map((x) => PastOrderList.fromJson(x))),

    //pastOrderList: List<OnGoingOrderList>.from(json["ongoing_order_list"].map((x) => OnGoingOrderList.fromJson(x)))
  );

}

class PastOrderList {
  int id;
  int userId;
  int storeId;
  String instruction;
  String isWallet;
  String isPinned;
  String address;
  String subTotal;
  String deliveryFee;
  String totalAmount;
  int orderStatus;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  Null transactionId;
  RxList<OrderItems> orderItems;

  PastOrderList(
      { this.id,
         this.userId,
         this.storeId,
         this.instruction,
         this.isWallet,
         this.isPinned,
         this.address,
         this.subTotal,
          this.deliveryFee,
         this.totalAmount,
          this.orderStatus,
          this.createdAt,
          this.updatedAt,
        this.deletedAt,
        this.transactionId,
         this.orderItems});

  factory PastOrderList.fromJson(Map<String, dynamic> json) => PastOrderList(

      id : json['id'],
      userId : json['user_id'],
      storeId : json['store_id'],
      instruction : json['instruction'],
      isWallet : json['is_wallet'],
      isPinned : json['is_pinned'],
      address : json['address'],
      subTotal : json['sub_total'],
      deliveryFee : json['delivery_fee'],
      totalAmount : json['total_amount'],
      orderStatus : json['order_status'],
      createdAt : json['created_at'],
      updatedAt : json['updated_at'],
      deletedAt : json['deleted_at'],
      transactionId : json['transaction_id'],
      orderItems: RxList<OrderItems>.from(json["order_items"].map((x) => OrderItems.fromJson(x)))

  );



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['store_id'] = this.storeId;
    data['instruction'] = this.instruction;
    data['is_wallet'] = this.isWallet;
    data['is_pinned'] = this.isPinned;
    data['address'] = this.address;
    data['sub_total'] = this.subTotal;
    data['delivery_fee'] = this.deliveryFee;
    data['total_amount'] = this.totalAmount;
    data['order_status'] = this.orderStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['transaction_id'] = this.transactionId;
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  int id;
  int orderMasterId;
  int userId;
  int productId;
  int varientId;
  String varientPrice;
  String totalAmount;
  int productValue;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  String productDetailsimage;
  String productDetailsName;
  String variantDetailsCost;
  String variantDetailsUnit;
  // ProductDetails productDetails;
  // VarientDetails varientDetails;

  OrderItems(
      { this.id,
         this.orderMasterId,
         this.userId,
         this.productId,
         this.varientId,
         this.varientPrice,
         this.totalAmount,
         this.productValue,
          this.createdAt,
         this.updatedAt,
        this.deletedAt,
         this.productDetailsimage,
         this.productDetailsName,
         this.variantDetailsCost,
         this.variantDetailsUnit,
        //required  this.productDetails, required this.varientDetails
      });

  factory OrderItems.fromJson(Map<String, dynamic> json) =>OrderItems(
    id : json['id'],
    orderMasterId : json['order_master_id'],
    userId : json['user_id'],
    productId : json['product_id'],
    varientId : json['varient_id'],
    varientPrice : json['varient_price'],
    totalAmount : json['total_amount'],
    productValue : json['product_value'],
    createdAt : json['created_at'],
    updatedAt : json['updated_at'],
    deletedAt : json['deleted_at'],
    productDetailsimage : json['product_details']['image'],
    productDetailsName : json['product_details']['name'],
    variantDetailsUnit : json['varient_details']['unit'],
    variantDetailsCost : json['varient_details']['cost'],
    // varientDetails : json['varientDetails'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_master_id'] = this.orderMasterId;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['varient_id'] = this.varientId;
    data['varient_price'] = this.varientPrice;
    data['total_amount'] = this.totalAmount;
    data['product_value'] = this.productValue;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;

    return data;
  }
}