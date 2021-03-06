//import 'dart:async';
//import 'dart:convert';
//
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'themes_data.dart' as themes;
//
//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Flutter Demo',
//      theme: new ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
//        // counter didn't reset back to zero; the application is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      home: new MyHomePage(title: 'Andy Park'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//  String _andy  = "";
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  void _displayName(){
//    setState(() {
//      _andy = "Andy";
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return new Scaffold(
//      appBar: new AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: new Text(widget.title),
//      ),
//      drawer: new Drawer(
//          child: new ListView(
//            children: <Widget> [
//              new DrawerHeader(child: new Text('Header'),),
//              new ListTile(
//                title: new Text('First Menu Item'),
//                onTap: () {},
//              ),
//              new ListTile(
//                title: new Text('Second Menu Item'),
//                onTap: () {},
//              ),
//              new Divider(),
//              new ListTile(
//                title: new Text('About'),
//                onTap: () {},
//              ),
//            ],
//          )
//      ),
//      body: new Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: new Column(
//          // Column is also layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug paint" (press "p" in the console where you ran
//          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
//          // window in IntelliJ) to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(
//              'You have pushed the button this many times:$_andy',
//
//            ),
//            new FlatButton(
//                onPressed: (){
//                  Future<themes.Post> fetchPost() async{
//                    final response = await http.get('http://www.mystart-apps.com/api/v1/themes?email=admin@mrgeekmsi.com');
//                    setState(() {
//                      _andy = json.decode(response.body);
//                    });
//                    print(response.body);
//                    return themes.Post.fromJson(json.decode(response.body));
//                  }
//
//                  fetchPost();
//
////                  FutureBuilder<String>(
////                    future: fetchPost(),
////                    builder: (c,s) {
////                      print("ASYNC: " + s.data);
////                      setState(() {
////
////                        _andy = s.data;
////                      });
////                      return CircularProgressIndicator();
////
////                    }
////
////                  );
//
//                  setState(() {
//                    _counter++;
//                  });
//                },
//                child: new Icon(Icons.exposure_plus_1)
//            ),
//            new FlatButton(
//                onPressed: (){
//                  setState(() {
//                    _counter--;
//                  });
//                },
//                textTheme: ButtonTextTheme.accent,
//
//                child: new Icon(Icons.exposure_neg_2)
//            ),
//
//          ],
//        ),
//      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: new Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
