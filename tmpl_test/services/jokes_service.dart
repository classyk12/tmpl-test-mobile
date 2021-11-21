import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tmpl_test/utils/error_handler.dart';

import 'resource.dart';

class JokesService {
  final _resource = ResourceService();

  Future<Response> getJokes() async {
    try {
      Response response =
          await _resource.request('jokes?count=20', body: null, method: "Get");
      debugPrint('this is response status ==>${response.statusCode}');
      return response;
    } on DioError catch (e) {
      throw ErrorHandler.catchError(e);
    }
  }
}
