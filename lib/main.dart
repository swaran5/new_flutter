import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter/app_screens/second_screen.dart';
import 'package:new_flutter/timer.dart';
import 'DataFromApi.dart';
import 'package:js/js.dart';

import 'counter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MyFlutterApp());
}

class MyFlutterApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My Flutter App",
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => HomePage(),
          '/helloworld': (BuildContext context) => Link(),
        },
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: Text("List of User"),
        //     backgroundColor: Colors.red,
        //   ),
        //   body: new HomePage()
        // )
    );
  }
}
