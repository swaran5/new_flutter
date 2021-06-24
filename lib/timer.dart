
import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:new_flutter/viewmodel/timer_viewmodel.dart';
import 'package:provider/provider.dart';

class TimerSeconds extends StatefulWidget {

  @override
  _TimerSecondsState createState() => _TimerSecondsState();
}

class _TimerSecondsState extends State<TimerSeconds> {

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
    return Container(
      child: Center(
        child: Consumer<TimerViewmodel>(
          builder: (context, data, child){
            return Text(
                data.getremainingtime().toString()
            );

    },
        ),
      ),
    );
  }
}
