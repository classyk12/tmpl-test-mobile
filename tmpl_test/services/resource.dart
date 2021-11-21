import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ResourceService {
  final Dio _dio = Dio();
  String? baseUrl = '';
  String? contentType;

  ResourceService({this.baseUrl, this.contentType}) {
    _dio.options.baseUrl = "";
    _dio.options.connectTimeout = 60 * 1000; // 60 seconds
    _dio.options.receiveTimeout = 60 * 1000; // 60 seconds
  }

  Future<Response> request(String endpoint,
      {dynamic body, String? method}) async {
    var res = _dio.request(endpoint,
        data: body,
        options: Options(
            method: method,
            followRedirects: false,
            validateStatus: (status) {
              //use this to make sure to return every other status code as a response except 500
              return status! < 500;
            }));

    debugPrint('request uri = ${_dio.options.baseUrl}$endpoint');
    return res;
  }
}
