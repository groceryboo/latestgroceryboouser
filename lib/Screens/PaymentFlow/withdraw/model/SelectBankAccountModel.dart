import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';


SelectBankAccountModel selectBankAccountModelFromJson(String str) =>
    SelectBankAccountModel.fromJson(json.decode(str));

String selectBankAccountModelToJson(SelectBankAccountModel data) =>
    json.encode(data.toJson());

class SelectBankAccountModel {
  SelectBankAccountModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool success;
  int statusCode;
  String message;
  List<BankDetail> data;

  factory SelectBankAccountModel.fromJson(Map<String, dynamic> json) =>
      SelectBankAccountModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: RxList<BankDetail>.from(json["data"].map((x) => BankDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BankDetail {
  int id;
  int userId;
  String bankName;
  String accountNumber;
  String routingNumber;
  String swiftCode;
  String bankAddress;
  int accountType;
  String image;
  int saveAs;
  String createdAt;
  String updatedAt;
  String deletedAt;

  BankDetail(
      {this.id,
      this.userId,
      this.bankName,
      this.accountNumber,
      this.routingNumber,
      this.swiftCode,
      this.bankAddress,
      this.accountType,
      this.image,
      this.saveAs,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  factory BankDetail.fromJson(Map<String, dynamic> json) => BankDetail(
        id: json['id'],
        userId: json['user_id'],
        bankName: json['bank_name'],
        accountNumber: json['account_number'],
        routingNumber: json['routing_number'],
        swiftCode: json['swift_code'],
        bankAddress: json['bank_address'],
        accountType: json['account_type'],
        image: json['image'],
        saveAs: json['save_as'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        deletedAt: json['deleted_at'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        'user_id': userId,
        'bank_name': bankName,
        'account_number': accountNumber,
        'routing_number': routingNumber,
        'swift_code': swiftCode,
        'bank_address': bankAddress,
        'account_type': accountType,
        'image': image,
        'save_as': saveAs,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };
}
