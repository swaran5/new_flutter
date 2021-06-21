import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 250,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.centerLeft,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                            ),
                          ),),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                          ),
                        ),
                      ],)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Container(
// width: 250,
// height: 200,
// child: ClipRRect(
// borderRadius: new BorderRadius.circular(70.0),
// child: Image(
// fit: BoxFit.contain,
// alignment: Alignment.centerLeft,
// image: AssetImage("images/family.png")
// ),
// ),),