// To parse this JSON data, do
//
//     final pinnedListModel = pinnedListModelFromJson(jsonString);

import 'dart:convert';

PinnedListModel pinnedListModelFromJson(String str) => PinnedListModel.fromJson(json.decode(str));

String pinnedListModelToJson(PinnedListModel data) => json.encode(data.toJson());

class PinnedListModel {
    PinnedListModel({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool success;
    int statusCode;
    String message;
    List<dynamic> data;

    factory PinnedListModel.fromJson(Map<String, dynamic> json) => PinnedListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x)),
    };
}
