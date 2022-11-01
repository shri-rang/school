// To parse this JSON data, do
//
//     final circularDetailModel = circularDetailModelFromJson(jsonString);

import 'dart:convert';

CircularDetailModel circularDetailModelFromJson(String str) =>
    CircularDetailModel.fromJson(json.decode(str));

String circularDetailModelToJson(CircularDetailModel data) =>
    json.encode(data.toJson());

class CircularDetailModel {
  CircularDetailModel({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  int? status;
  bool? error;
  String? messages;
  Data? data;

  factory CircularDetailModel.fromJson(Map<String, dynamic> json) =>
      CircularDetailModel(
        status: json["status"],
        error: json["error"],
        messages: json["messages"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages": messages,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.composeId,
    this.senderId,
    this.fromName,
    this.toName,
    this.type,
    this.receiverId,
    this.title,
    this.attachment,
    this.allowReply,
    this.lastReplyDate,
    this.message,
    this.lastReplyTime,
    this.isDelete,
    this.timestamp,
  });

  String? composeId;
  String? senderId;
  String? fromName;
  String? toName;
  String? type;
  String? receiverId;
  String? title;
  String? attachment;
  dynamic allowReply;
  dynamic lastReplyDate;
  String? message;
  dynamic lastReplyTime;
  String? isDelete;
  DateTime? timestamp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        composeId: json["composeID"],
        senderId: json["senderID"],
        fromName: json["from_name"],
        toName: json["to_name"],
        type: json["type"],
        receiverId: json["receiverID"],
        title: json["title"],
        attachment: json["attachment"],
        allowReply: json["allow_reply"],
        lastReplyDate: json["last_reply_date"],
        message: json["message"],
        lastReplyTime: json["last_reply_time"],
        isDelete: json["is_delete"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "composeID": composeId,
        "senderID": senderId,
        "from_name": fromName,
        "to_name": toName,
        "type": type,
        "receiverID": receiverId,
        "title": title,
        "attachment": attachment,
        "allow_reply": allowReply,
        "last_reply_date": lastReplyDate,
        "message": message,
        "last_reply_time": lastReplyTime,
        "is_delete": isDelete,
        "timestamp": timestamp!.toIso8601String(),
      };
}
