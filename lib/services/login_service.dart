import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ecpay/model/response_model.dart';
import 'package:flutter_ecpay/utilities/device_id.dart';
import 'package:flutter_ecpay/utilities/request.dart';

import '../repo/response.dart';
import '../utilities/http.dart';

class LoginService {
  static Future<Object> loginNumber(
    String mobileno,
  ) async {
    Request request = Request();
    try {
      DeviceID deviceID = DeviceID();
      var devinfo = await deviceID.getDeviceID();
      dio.options.headers["deviceid"] = devinfo["id"];
      var param = {"password": "0000", "mobileNo": mobileno, "type": "1"};
      var response = await request.request("/login", "POST", body: param);
      if (response.statusCode == 200) {
        JsonEncoder json = const JsonEncoder();
        String str = json.convert(response.data);
        return Success(code: 0, response: responseModelFromJson(str));
      }
      return Failure(code: 100, errorResponse: 'Error');
    } on DioException catch (e) {
      return Failure(code: 105, errorResponse: e.message!);
    }
  }

  static Future<Object> sendOtp(
    String mobileno,
  ) async {
    Request request = Request();
    try {
      DeviceID deviceID = DeviceID();
      var devinfo = await deviceID.getDeviceID();
      dio.options.headers["deviceid"] = devinfo["id"];
      var param = {"password": "0000", "mobileNo": mobileno, "type": "1"};
      var response = await request.request("/activate", "POST", body: param);
      if (response.statusCode == 200) {
        JsonEncoder json = const JsonEncoder();
        String str = json.convert(response.data);
        return Success(code: 0, response: responseModelFromJson(str));
      }
      return Failure(code: 100, errorResponse: 'Error');
    } on DioException catch (e) {
      return Failure(code: 105, errorResponse: e.message!);
    }
  }

  static Future<Object> verifyOtp(String mobileno, String code) async {
    Request request = Request();
    try {
      DeviceID deviceID = DeviceID();
      var devinfo = await deviceID.getDeviceID();
      dio.options.headers["deviceid"] = devinfo["id"];
      var param = {"code": code, "mobileNo": mobileno, "type": "1"};
      var response = await request.request("/codeVerify", "POST", body: param);
      if (response.statusCode == 200) {
        JsonEncoder json = const JsonEncoder();
        String str = json.convert(response.data);
        return Success(code: 0, response: responseModelFromJson(str));
      }
      return Failure(code: 100, errorResponse: 'Error');
    } on DioException catch (e) {
      return Failure(code: 105, errorResponse: e.message!);
    }
  }
}
