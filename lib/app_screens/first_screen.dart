import 'dart:math';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.amber,
        child: getWidget(),
        );
  }

   getWidget() {

    return Column(
      children: [
        Expanded(
          flex: 2,
            child:  Container(
              color: Colors.blue,
            ),
        ),
        Expanded(
          flex: 4,
          child:  Container(
            color: Colors.red,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                    child: Container(
                      color: Colors.black,
                    ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.yellow,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                            child: Container(
                              color: Colors.white,
                            )
                        ),
                        Expanded(
                          flex: 6,
                            child: Container(
                              color: Colors.yellow,
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),  Expanded(
          flex: 4,
          child:  Container(
            color: Colors.blue,
          ),
        ),
        // Container(
        //   height: 100,
        //   width: 100,
        //   color: Colors.red,
        // ),
        // Container(
        //   height: 100,
        //   width: 100,
        //   color: Colors.blue,
        // ),
      ],
    );
  }
}
