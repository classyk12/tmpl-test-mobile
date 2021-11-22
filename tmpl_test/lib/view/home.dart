import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tmpl_test/controllers/home-controller.dart';
import 'package:tmpl_test/utils/error_handler.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Users'),
        ),
        body: Obx(() {
          if (_homeController.progress.value == LoadingEnum.loading) {
            return Center(
                child: CircularProgressIndicator(color: Colors.black));
          }
          if (_homeController.progress.value == LoadingEnum.done) {
            return ListView.separated(
              padding: EdgeInsets.zero,
              physics: ScrollPhysics(),
              itemCount: _homeController.jokes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text(
                  (_homeController.jokes[index].joke!),
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            );
          }
          return HandleError(
              _homeController.error.value, _homeController.getData);
        }));
  }
}
