import 'package:flutter/material.dart';
import 'package:new_flutter/app_screens/first_screen.dart';
import 'package:new_flutter/app_screens/second_screen.dart';

import 'DataFromApi.dart';

void main() {
  runApp(new MyFlutterApp());
}

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My Flutter App",
        home: Scaffold(
          appBar: AppBar(
            title: Text("First Screen"),
            backgroundColor: Colors.red,
          ),
          body: new DataFromApi()
        ));
  }
}
