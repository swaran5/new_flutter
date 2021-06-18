import 'dart:math';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.amber,
      child: Center(
        child: Text(
          gernerateRandomNumber(),
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.red,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }

  String gernerateRandomNumber() {
      var random = new Random();
      var num = random.nextInt(10);
      return "Your lucky number is $num";
  }
}