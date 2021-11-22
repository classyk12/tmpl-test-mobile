import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tmpl_test/controllers/home_controller.dart';
import 'package:tmpl_test/utils/error_handler.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red,
          title: const Text('Jokes'),
        ),
        body: Obx(() {
          if (_homeController.progress.value == LoadingEnum.loading) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.black));
          }
          if (_homeController.progress.value == LoadingEnum.done) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              physics: const ScrollPhysics(),
              itemCount: _homeController.jokes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  child: Text(
                    (_homeController.jokes[index].joke!),
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Divider(),
                );
              },
            );
          }
          return handleError(
              _homeController.error.value, _homeController.getData);
        }));
  }
}
