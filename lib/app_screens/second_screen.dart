import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter/DataFromApi.dart';
import 'package:new_flutter/counter.dart';
import 'package:new_flutter/timer.dart';
import 'package:new_flutter/viewmodel/timer_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    this.initDynamicLinks();
  }


  static List<Widget> _widgetOptions = <Widget>[
    DataFromApi(),

    // Text(
    //   'Index 1: Add User',
    //   style: optionStyle,
    // ),

    Counter(),

    // Text(
    //   'Index 2: User DB',
    //   style: optionStyle,
    // ),

    // ChangeNotifierProvider(
    //   create: (context) => TimerViewmodel(),
    //     child: TimerSeconds()
    // ),

    Link(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Add User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: 'User DB',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }

  Future<void> initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
          final Uri? deepLink = dynamicLink?.link;

          if (deepLink != null) {
            // ignore: unawaited_futures
            Navigator.pushNamed(context, deepLink.path);
          }
        }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData? data =
    await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      // ignore: unawaited_futures
      Navigator.pushNamed(context, deepLink.path);

    }
  }
}
