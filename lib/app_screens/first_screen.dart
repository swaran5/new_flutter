import 'dart:math';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.amber,
        child: getListView(),
        );
  }

  ListView getListView() {
    var items = new List<String>.generate(20, (index) => "Item $index");
    var listView = ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return getItemView(index);
        });
    return listView;
  }

  Widget getItemView(index) {
    Widget itemView = Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        elevation: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: 150,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(0),
                  ),
                  child: Image(
                    fit: BoxFit.fill,
                    alignment: Alignment.centerLeft,
                    image: AssetImage("images/item2.jpg"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      width: double.infinity,
                      height: 75,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "First Name $index",
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ))),
                  Container(
                      width: double.infinity,
                      height: 75,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Last Name $index",
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ))),
                ],
              )),
            ),
          ],
        ));
    return itemView;
  }
}
