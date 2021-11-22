import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  Future<Response> response;
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Temple Test Home')), body: Container()

        FutureBuilder(builder: (context, ))

        );
  }
}
