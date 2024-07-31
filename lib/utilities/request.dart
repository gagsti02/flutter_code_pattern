import 'package:dio/dio.dart';

import 'http.dart';

class Request {
  Future<Response> request(String url, String method,
      {dynamic param, dynamic body}) async {
    Response<dynamic> response;
    try {
      response = await dio.request(url,
          data: body, queryParameters: param, options: Options(method: method));
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return response;
      } else if (response.statusCode == 401) {
        return response;
      }
      return response;
    } on DioException catch (e) {
     return e.response!;
    }
  }
}
