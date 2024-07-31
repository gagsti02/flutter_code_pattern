// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

class ResponseModel {
  int status;
  String code;
  String msg;
  dynamic data;

  ResponseModel({
    required this.status,
    required this.code,
    required this.msg,
    required this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        status: json["status"],
        code: json["code"],
        msg: json["msg"],
        data: json["data"],
      );
}
