import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

RecentWithdrawModel recentWithdrawModelFromJson(String str) =>
    RecentWithdrawModel.fromJson(json.decode(str));

String recentWithdrawModelToJson(RecentWithdrawModel data) =>
    json.encode(data.toJson());

class RecentWithdrawModel {
  RecentWithdrawModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool success;
  int statusCode;
  String message;
  Data data;

  factory RecentWithdrawModel.fromJson(Map<String, dynamic> json) =>
      RecentWithdrawModel(
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
  String balance;
  List<RecentWithdraw> recentWithdraw;

  Data({this.balance, this.recentWithdraw});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    balance : json['Balance'],
    recentWithdraw: RxList<RecentWithdraw>.from(json["Recent Withdraw"].map((x) => RecentWithdraw.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "Balance": balance,
    "Recent Withdraw": List<dynamic>.from(recentWithdraw.map((x) => x.toJson())),
  };
}

class RecentWithdraw {
  String account;
  String date;
  String amount;
  String status;

  RecentWithdraw({this.account, this.date, this.amount, this.status});

  factory RecentWithdraw.fromJson(Map<String, dynamic> json) => RecentWithdraw(
    account: json['account'],
    date : json['date'],
    amount: json['amount'],
    status: json['status'],
  );

  Map<String, dynamic> toJson() => {
    'account': account,
    'date': date,
    'amount': amount,
    'status': status,
  };
}