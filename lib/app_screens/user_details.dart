import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_flutter/model/single_user.dart';
import 'package:new_flutter/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';

class UserDetails extends StatefulWidget {
  String id;

  UserDetails(this.id);

  @override
  State<StatefulWidget> createState() => _UserDetails(id);
}

class _UserDetails extends State<UserDetails> {
  String id;

  _UserDetails(this.id);

  late User user;
  bool wait = true;

  getUserData() async {
    var response = await http.get(Uri.https("reqres.in", "/api/users/$id"));
    var jsonData = jsonDecode(response.body);

    setState(() {
      user = userFromJson(response.body);
      wait = false;
    });
    return user;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    if (!wait) {
      return Scaffold(
          appBar: AppBar(
            title: Text("User Details"),
          ),
          body: Material(
            child: Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: user.data.avatar,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  elevation: 6.0,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,0,20.0),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(user.data.avatar),
                            ),
                          ),
                        ),
                        Text("First Name : "+user.data.firstName,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              ),
                        ),
                        Text("Last Name : "+user.data.lastName,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              ),
                        ),
                        Text("Email : "+user.data.email,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "User Details",
            ),
          ),
          body: Material(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 6.0,
            ),
          ));
    }
  }
}
