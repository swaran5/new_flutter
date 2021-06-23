import 'dart:math';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  String name;

  FirstScreen(this.name);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: getWidget(),
    );
  }

  getWidget() {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: getCardView()
        ),
        Expanded(
          flex: 3,
          child: Container(
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
                            )),
                        Expanded(
                            flex: 6,
                            child: Container(
                              color: Colors.yellow,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget getCardView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(Icons.import_contacts),
          title: Text("jhsdc"),
          subtitle: Text("hjbd"),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          elevation: 6.0,
          color: Colors.yellow,
          child: ListTile(
            leading: Icon(Icons.import_contacts),
            title: Text(name),
            subtitle: Text("hjbd"),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 6.0,
              color: Colors.yellow,
              child: Text("data"),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 6.0,
              color: Colors.yellow,
              child: Text("data"),
            ), Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 6.0,
              color: Colors.yellow,
              child: Text("data"),
            ), Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 6.0,
              color: Colors.yellow,
              child: Text("data"),
            ),
          ],
        ),
      ],
    );
  }
}
