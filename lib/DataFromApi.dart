
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/user_model.dart';

class DataFromApi extends StatefulWidget{
  @override
  _DataFromAPIStake createState() => _DataFromAPIStake();
}

class _DataFromAPIStake extends State{

  Future<Users> getUserData() async {
    var response = await http.get(Uri.https("reqres.in", "/api/users", {"page" : "1"}));
    var jsonData = jsonDecode(response.body);

    final Users users = usersFromJson(response.body);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.amber,
        child: getListView(),
        );
  }

  Widget getListView() {
   return FutureBuilder(
        future: getUserData(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return Text("null");
            }
            else {
              ListView listView = ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return getItemView(snapshot, index);
                  });
              return listView;
            }
          }
          else if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Error'); // error
          }
          else {
            return CircularProgressIndicator(); // loading
          }
        }
    );
  }

  Widget getItemView(AsyncSnapshot snapshot, int index) {
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
                    image: NetworkImage(snapshot.data.data[index].avatar),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                                "First Name :${snapshot.data.data[index].firstName}",
                                style: TextStyle(color: Colors.black, fontSize: 25),
                              ))),
                      Container(
                          width: double.infinity,
                          height: 75,
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Last Name :${snapshot.data.data[index].lastName}",
                                style: TextStyle(color: Colors.black, fontSize: 25),
                              ))),
                    ],
                  )),
            ),
          ],
        ));
    return itemView;
  }
}