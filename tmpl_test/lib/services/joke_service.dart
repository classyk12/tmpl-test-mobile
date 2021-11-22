import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tmpl_test/utils/error_handler.dart';

import 'resource.dart';

class JokesService {
  final _resource = ResourceService();

  Future<Response> getJokes() async {
    var res = null;
    try {
      Response res =
          await _resource.request('jokes?count=20', body: null, method: "Get");
      debugPrint('this is response status ==>${res.statusCode}');
      return res;
    } catch (e) {
      return returnResponse(res);
    }
  }
}
