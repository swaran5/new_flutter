
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter/app_screens/second_screen.dart';

class MenuDashBoard extends StatefulWidget{
  @override
  _MenuDashBoardState createState() => _MenuDashBoardState();
}

class _MenuDashBoardState extends State<MenuDashBoard> {

  bool iscollapsed = true;
  double screenWidth = 0 , screenHeight = 0;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               CircleAvatar(
                 radius: 60,
                 backgroundImage: AssetImage("images/item2.jpg"),
               ),
            SizedBox(
              height: 20,
            ),
            Text("Swaran",
              style: TextStyle(color: Colors.amber, fontSize: 28),
            ),
            Text("swaran@gobumpr.com",
              style: TextStyle(color: Colors.amber, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Text("DashBoard",
            style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Messages",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Funds",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Bills",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Log out",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboard(BuildContext context){
    return AnimatedPositioned(
      top: iscollapsed ? 0 : 0.15 * screenHeight,
      bottom: iscollapsed ? 0 : 0.15*screenWidth,
      left: iscollapsed ? 0 : 0.6*screenWidth,
      right: iscollapsed ? 0 : -0.4*screenWidth,
      duration: Duration(milliseconds: 200),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(iscollapsed ? 0 : 40),
      child: Material(
        elevation: 8,
        color: Colors.blueGrey,
    child: Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child: Icon(Icons.menu),
          onTap: (){
              setState(() {
                iscollapsed = !iscollapsed;
              });
          },
        ),
      ),
      body: HomePage()
    ),
      ),
    ),
    );
  }
}