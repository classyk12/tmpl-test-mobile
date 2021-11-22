import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmpl_test/models/jokes_model.dart';

class HomeController extends GetxController {
  var progress = LoadingEnum.loading.obs;
  var jokes = <JokeModel>[].obs;
  var error = ''.obs;
  var jokeService = JokesService();

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future getData() async {
    progress.value = LoadingEnum.loading;
    try {
      var response = await jokeService.getJokes();
      progress.value = LoadingEnum.done;
      if (response != null) {
        jokes.assignAll(response.data);
      } else {
        progress.value = LoadingEnum.failed;
      }
    } catch (err) {
      progress.value = LoadingEnum.failed;
      error.value = err.toString();
      debugPrint('err');
    }
  }
}

enum LoadingEnum { loading, done, failed }
