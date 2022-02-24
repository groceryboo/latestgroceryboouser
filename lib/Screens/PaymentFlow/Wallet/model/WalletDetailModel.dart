import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

WalletDetailModel walletDetailModelFromJson(String str) =>
    WalletDetailModel.fromJson(json.decode(str));

String walletDetailModelToJson(WalletDetailModel data) =>
    json.encode(data.toJson());

class WalletDetailModel {
  WalletDetailModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool success;
  int statusCode;
  String message;
  Data data;

  factory WalletDetailModel.fromJson(Map<String, dynamic> json) =>
      WalletDetailModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String walletAmount;
  int pinRevenue;
  int adsRevenue;
  List<Transaction> transaction;

  Data({this.walletAmount, this.pinRevenue, this.adsRevenue, this.transaction});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    walletAmount : json['wallet_amount'],
    pinRevenue: json['Pin Revenue'],
    adsRevenue: json['Ads Revenue'],
    transaction: RxList<Transaction>.from(json["Transaction"].map((x) => Transaction.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "wallet_amount": walletAmount,
    "Pin Revenue": pinRevenue,
    "Ads Revenue": adsRevenue,
    "Transaction": List<dynamic>.from(transaction.map((x) => x.toJson())),
  };
}

class Transaction {
  String date;
  String amount;
  String transactionType;

  Transaction({this.date, this.amount, this.transactionType});

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    date : json['date'],
    amount: json['amount'],
    transactionType: json['transaction type'],
  );

  Map<String, dynamic> toJson() => {
    'date': date,
    'amount': amount,
    'transaction type': transactionType,
  };
}