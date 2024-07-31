import 'package:dio/dio.dart';

String baseUrl = "http://10.0.2.2:8827/";

final dio = Dio(
  BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 3),
      headers: {"Package-Name": "com.vj.ecpay.uat", "API-Signature": ""}),
);
