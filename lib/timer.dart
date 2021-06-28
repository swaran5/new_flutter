
import 'dart:async';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter/viewmodel/timer_viewmodel.dart';
import 'package:provider/provider.dart';

class TimerSeconds extends StatefulWidget {

  @override
  _TimerSecondsState createState() => _TimerSecondsState();
}

class _TimerSecondsState extends State<TimerSeconds> {

  final database = FirebaseDatabase.instance;

  @override
  void initState() {

    Timer.periodic(Duration(seconds: 1), (timer) {

      var timeviewmodel = Provider.of<TimerViewmodel>(context, listen: false);
      timeviewmodel.updateremaingtime();

    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final ref = database.reference();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        ElevatedButton(onPressed: () => {

          ref.child("user").set("swaran")
        },
            child: Text("submit"))
      ],
    );
    // return Container(
    //   child: Center(
    //     child: Consumer<TimerViewmodel>(
    //       builder: (context, data, child){
    //         return Text(
    //             data.getremainingtime().toString()
    //         );
    //
    // },
    //     ),
    //   ),
    // );
  }
}
