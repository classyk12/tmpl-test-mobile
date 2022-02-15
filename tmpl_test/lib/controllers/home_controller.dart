import 'package:get/get.dart';
import 'package:tmpl_test/models/jokes_model.dart';
import 'package:tmpl_test/services/joke_service.dart';

class HomeController extends GetxController {
  var progress = LoadingEnum.loading.obs;
  var jokes = <JokesModel>[].obs;
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
      var res = await jokeService.getJokes();
      progress.value = LoadingEnum.done;
      if (res.statusCode == 200 || res.statusCode == 201) {
        jokes.value = jokesModelFromMap(res.data!);
      } else {
        progress.value = LoadingEnum.failed;
      }
    } catch (err) {
      progress.value = LoadingEnum.failed;
      error.value = 'Unable to load jokes, try again';
    }
  }
}

enum LoadingEnum { loading, done, failed }
