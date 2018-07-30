//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http;
//import 'package:cswauthapp/models.dart';
//import 'package:cswauthapp/FacPage.dart';
//import 'package:cswauthapp/ReasonPage.dart';
//
//import 'dart:convert';
//
//
//class SpecPage extends StatefulWidget {
//  SpecPage({Key key, this.spec}) : super(key: key);
//
//  final Specialties spec;
//
//  //final Facilities fac;
//  //static const String routeName = "/specs/spec";
//
//  @override
//  _SpecPageState createState() => new _SpecPageState();
//}
//
//class _SpecPageState extends State<SpecPage> {
//  Future<http.Response> _responseFuture;
//
//  bool _authenticated = false;
//  bool _dataReceived = false;
//  SharedPreferences prefs;
//  List myReasonlist;
//  int listcount = 0;
//  int specid;
//
//  @override
//  void initState() {
//    super.initState();
//    _responseFuture = http.get('http://174.138.61.246:8080/support/dc/${widget.spec.id}');
//
//    _getPrefs();
//    //_getSpecialty();
//    //_getFacilities();
//  }
//
//  _getPrefs() async {
//    prefs = await SharedPreferences.getInstance();
//    _authenticated = prefs.getBool('authenticated');
//    print('AUTH3: ' + _authenticated.toString());
//    print('AUTHCODE3: ' + prefs.getString('authcode'));
//    prefs.setInt('specid', widget.spec.id);
//    print('SPECID: ' + prefs.getInt('specid').toString());
//    specid = await prefs.getInt('specid');
//    _getReasons();
//  }
//
//  var jsonCodec = const JsonCodec();
//
//  _getReasons() async {
//    var _url = 'http://csw.abbadabba.tech:8080/support/getreferralreasons/$specid';
//
//    var http = createHttpClient();
//    var response = await http.get(_url);
//
//    var reasons = await jsonCodec.decode(response.body);
//
//    myReasonlist = await reasons.toList();
//    //_dataReceived = true;
//
//    if (mounted) {
//      setState(() {
//        _dataReceived = true;
//        listcount = myReasonlist.length;
//      });
//    }
//  }
//
//  Future<Null> _onRefresh() {
//    Completer<Null> completer = new Completer<Null>();
//    Timer timer = new Timer(new Duration(seconds: 3), () {
//      completer.complete();
//    });
//    return completer.future;
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    var _children = <Widget>[
//
//      new Center(
//        child: new Container(
//          padding: new EdgeInsets.only(
//              left: 10.0, right: 10.0, top: 20.0, bottom: 10.0),
//          child: new Text('Referral Reasons for '+widget.spec.name,
//            style: new TextStyle(fontSize: 30.0),
//            textAlign: TextAlign.center,
//          ),
//        ),
//      ),
//
//      new Expanded(
//        child: new FutureBuilder(
//          future: _responseFuture,
//          builder: (BuildContext context, AsyncSnapshot<http.Response> response) {
//            if (!response.hasData) {
//              return const Center(
//                child: const Text('Loading...'),
//              );
//            } else if (response.data.statusCode != 200) {
//              return const Center(
//                child: const Text('Error loading data'),
//              );
//            } else {
//              List<dynamic> json = JSON.decode(response.data.body);
//              return new MyExpansionTileList(json);
//            }
//          },
//        ),
//
//      ),
//
//      /*new Expanded(
//        flex: 1,
//        child: new RefreshIndicator(
//          child: new ListView.builder(
//            itemBuilder: _itemBuilder,
//            itemCount: listcount,
//          ),
//          onRefresh: _onRefresh,
//
//        ),
//      ),*/
//
//    ];
//    return new Scaffold(
//      appBar: new AppBar(title: new Text("My Specialty")),
//      body: new Column(
//        children: _children,
//      ),
//    );
//  }
//
//  /*Widget _itemBuilder(BuildContext context, int index) {
//    Reasons reason = getReason(index);
//    return new ReasonWidget(reason: reason,);
//  }*/
//
//  Reasons getReason(int index) {
//    return new Reasons(
//        myReasonlist[index]['rid'],
//        myReasonlist[index]['reason'],
//        myReasonlist[index]['sid'],
//        myReasonlist[index]['specname']
//    );
//    //return new Specialties.fromMap(mylist[index]);
//
//  }
//}
//
//class MyExpansionTileList extends StatelessWidget {
//  final List<dynamic> elementList;
//
//  MyExpansionTileList(this.elementList);
//
//  List<Widget> _getChildren() {
//    List<Widget> children = [];
//    elementList.forEach((element) {
//      children.add(
//        new MyExpansionTile(element['did'], element['dname']),
//      );
//    });
//    return children;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new ListView(
//      children: _getChildren(),
//    );
//  }
//}
//
//class MyExpansionTile extends StatefulWidget {
//  final int did;
//  final String name;
//
//  MyExpansionTile(this.did, this.name);
//  @override
//  State createState() => new MyExpansionTileState();
//}
//
//class MyExpansionTileState extends State<MyExpansionTile> {
//  PageStorageKey _key;
//  Future<http.Response> _responseFuture;
//  List<Widget> reasonList;
//  List reasList;
//  //Reasons reason;
//
//  @override
//  void initState() {
//    super.initState();
//    _responseFuture =
//        http.get('http://174.138.61.246:8080/support/dcreasons/${widget.did}');
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    _key = new PageStorageKey('${widget.did}');
//    return new ExpansionTile(
//      key: _key,
//      title: new Text(widget.name,
//        style: new TextStyle(fontWeight: FontWeight.bold),
//      ),
//      children: <Widget>[
//        new FutureBuilder(
//          future: _responseFuture,
//          builder:
//              (BuildContext context, AsyncSnapshot<http.Response> response) {
//            if (!response.hasData) {
//              return const Center(
//                child: const Text('Loading...'),
//              );
//            } else if (response.data.statusCode != 200) {
//              return const Center(
//                child: const Text('Error loading data'),
//              );
//            } else {
//              List<dynamic> json = JSON.decode(response.data.body);
//              reasonList = [];
//              json.forEach((element) {
//
//                reasonList.add(new ListTile(
//                  dense: true,
//                  title: new Text(element['reason']),
//                  onTap: _onTap(new Reasons(element['rid'], element['reason'], element['sid'], element['specname'])),
//                ));
//              });
//              //reasList = json.toList();
//              return new Column(children: reasonList);
//            }
//
//          },
//
//        )
//      ],
//    );
//  }
//
//  _onTap(Reasons reason) {
//    Route route = new MaterialPageRoute(
//      settings: new RouteSettings(name: "/reasons/reason"),
//      builder: (BuildContext context) => new ReasonPage(reason: reason),
//    );
//    Navigator.of(context).push(route);
//  }
//}