//import 'package:flutter/material.dart';
//import 'package:flutter_app2/functions.dart';
//import 'package:flutter_app2/config.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:flutter_app2/class/storage.dart';
//import 'package:flutter_app2/class/variables.dart';
//
//class MyTabController extends StatefulWidget {
//  @override
//  _TabController createState() => _TabController();
//}
//
//class _TabController extends State<MyTabController> {
//  @override
//  Widget build(BuildContext context) {
//    return FutureBuilder<List>(
//        future: AppStorage.getTheme(),
//        builder: (BuildContext context,AsyncSnapshot<Map> snapshot){
//          switch (snapshot.connectionState) {
//            case ConnectionState.none: return new Text('Press button to start');
//            case ConnectionState.waiting: return new CircularProgressIndicator();
//            default:
//              if (snapshot.hasError){
//                print("error");
//                print(snapshot);
//                return new CircularProgressIndicator();
//              }
//
//              else
//                return Tabs(snapshot.data);
//          }
//        }
//    );
//
//  }
//}
//
//Widget Tabs(themeData){
//  return DefaultTabController(
//    length: 3,
//    child: Scaffold(
//      appBar: AppBar(
//        backgroundColor: functions.parsehexColor(themeData["primary"]),
//        bottom: TabBar(
//          unselectedLabelColor: functions.parsehexColor(themeData["secondary"]).withAlpha(50),
//          labelColor: functions.parsehexColor(themeData["secondary"]),
//          tabs: [
//            Tab(icon: Icon(Icons.home),text: "Home",),
//            Tab(icon: Icon(Icons.info),text: "About Us",),
//            Tab(icon: Icon(Icons.account_circle),text: "Profile",),
//            Tab(icon: Icon(Icons.notifications),text: "Notification",),
//          ],
//        ),
//        title: new Container(
//          child: new Row(
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              new Image.network(themeData["logo"],height: 50.0,),
//              Text(themeData["name"], style: TextStyle(color: functions.parsehexColor(themeData["secondary"]))),
//            ],
//          ),
//        )
//      ),
//      body: TabBarView(
//        children: <Widget>[
//          new Center(
//            child: new Column(
//              children: <Widget>[
//                new Text("Hey this is a sample txt"),
//                new FloatingActionButton(onPressed: (){
//
//                })
//              ],
//            ),
//          ),
//          new Container(
//
//            child: new Column(
//              mainAxisAlignment: MainAxisAlignment.start,
//              textDirection: TextDirection.rtl,
//              children: <Widget>[
//                new Text("About Us",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
//                new Text(themeData["about_us"]),
//
//              ],
//            ),
//          )
//
//        ],
//
//      ),
//
//    ),
//  );
//}