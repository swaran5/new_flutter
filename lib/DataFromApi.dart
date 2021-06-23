
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_flutter/app_screens/first_screen.dart';

import 'app_screens/user_details.dart';
import 'model/user_model.dart';

class DataFromApi extends StatefulWidget{
  @override
  _DataFromAPIStake createState() => _DataFromAPIStake();
}

class _DataFromAPIStake extends State{
  List<Datum> users = [];
  int pagenum = 1;
  ScrollController scrollController = ScrollController();

  Future<List<Datum>> getUserData() async {
    var response = await http.get(Uri.https("reqres.in", "/api/users", {"page" : pagenum.toString()}));
    var jsonData = jsonDecode(response.body);

    setState(() {
      users = usersFromJson(response.body).data;
    });
    return users;
  }

  getMoreData() async {
    print("get more users");
    pagenum = pagenum+1;
    var response = await http.get(Uri.https("reqres.in", "/api/users", {"page" : pagenum.toString()}));

    if(usersFromJson(response.body).data != null) {
      setState(() {
        users.addAll(usersFromJson(response.body).data);
      });
      return users;
    }
    else{
      return;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserData();

    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.2;

      if(maxScroll - currentScroll <= delta){
        getMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.amber,
        child: getListView(),
        );
  }

  Widget getListView() {
   return ListView.builder(
       itemCount: users.length,
       controller: scrollController,
       itemBuilder: (BuildContext context, int index) {
         return getItemView(index);
       });

    //  FutureBuilder(
    //     future: getUserData(),
    //     builder: (BuildContext context,AsyncSnapshot snapshot){
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         if (snapshot.data == null) {
    //           return Text("null");
    //         }
    //         else {
    //           ListView listView = ListView.builder(
    //               itemCount: snapshot.data.length,
    //               controller: scrollController,
    //               itemBuilder: (BuildContext context, int index) {
    //                 return getItemView(snapshot, index);
    //               });
    //           return listView;
    //         }
    //       }
    //       else if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Text('Error'); // error
    //       }
    //       else {
    //         return CircularProgressIndicator(); // loading
    //       }
    //     }
    // );
  }

  Widget getItemView(int index) {
    Widget itemView = GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => UserDetails(users[index].id.toString())
        )
        );
      },
      child: Card(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        elevation: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: 130,
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
                    image: NetworkImage(users[index].avatar),
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
                          height: 65,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "First Name :${users[index].firstName}",
                                style: TextStyle(color: Colors.black, fontSize: 25),
                              ))),
                      Container(
                          width: double.infinity,
                          height: 65,
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Last Name :${users[index].lastName}",
                                style: TextStyle(color: Colors.black, fontSize: 25),
                              ))),
                    ],
                  )),
            ),
          ],
        )
      )
    );
    return itemView;
  }
}