import 'package:flutter/material.dart';
import 'package:flutter_app2/class/variables.dart';
import 'package:flutter_app2/functions.dart';
import 'package:flutter_app2/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class components {

  static Widget appBar(){
//    final future = functions.getTheme();
//    future.then((list) {
//      variables.themeData = list;
//      //print(variables.themeData["name"]);
//    });
    Config config = new Config();
    return new AppBar(
      backgroundColor: functions.parsehexColor(Config.primary_color),
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.home),text: "Home",),
          Tab(icon: Icon(Icons.info),text: "About Us",),
          Tab(icon: Icon(Icons.account_circle),text: "Profile",),
          Tab(icon: Icon(Icons.notifications),text: "Notification",),
        ],
      ),
      title: Text(Config.app_name, style: TextStyle(color: Colors.white)),
    );
  }

  static Widget navBar(c){
    
    return new Drawer(
        child: new ListView(
          children: <Widget> [
            new DrawerHeader(
              child: new Text('Header 1'),
              decoration: BoxDecoration(color: Colors.black),
            ),
            new ListTile(
              leading: new Icon(Icons.shopping_cart),
              title: new Text(Config.drawer_menu_1),
              onTap: () {},
            ),
            new ListTile(
              leading: new Icon(Icons.star),
              title: new Text(Config.drawer_menu_2),
              onTap: () {},
            ),
            new ListTile(
              leading: new Icon(Icons.location_on),
              title: new Text(Config.drawer_menu_3),
              onTap: () {},
            ),
            new ListTile(
              leading: new Icon(Icons.email),
              title: new Text(Config.drawer_menu_4),
              onTap: () {},
            ),
            new Divider(),
            new ListTile(
              leading: new Icon(Icons.info),
              title: new Text(Config.drawer_menu_5),
              onTap: () {},
            ),
          ],
        )
    );
  }

  static Widget content (Function _pagechange){
//    final Function _pagechange;
//    this._pagechange = _pageChange;
    int i = _pagechange();
    return new Row(
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(10.0),
              child: new Text("Home xx ${i}"),
              
            ),
            new FloatingActionButton(onPressed: _pagechange)
          ],
        )
      ],

    );
  }

//    final future = functions.getTheme();
//    future.then((list) {
//      variables.themeData = list;
//      //print(variables.themeData["name"]);
//    });

//    return new FutureBuilder(
//        future: functions.getTheme(),
//        builder: (BuildContext context, AsyncSnapshot snapshop){
//          print("hey");
//          print(snapshop.data["pages"].toString());
//          print("hey");
//
//        });
//
//  }

}


class MyAppBar extends StatefulWidget {
  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      backgroundColor: functions.parsehexColor(Config.primary_color),
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.home),text: "Home",),
          Tab(icon: Icon(Icons.info),text: "About Us",),
          Tab(icon: Icon(Icons.account_circle),text: "Profile",),
          Tab(icon: Icon(Icons.notifications),text: "Notification",),
        ],
      ),
      title: Text("hey", style: TextStyle(color: Colors.white)),
    );
  }
}



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


