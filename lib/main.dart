import 'dart:async';
import 'package:flutter/material.dart';
import 'components/tabcontroller.dart';
import 'class/storage.dart';
import 'class/initializer.dart';
import 'class/variables.dart';
import 'functions.dart';
import 'config.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MSAApp());
}
ThemeData _themedata;
class MSAApp extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared preferences demo',
      theme: _themedata,
      home: MSAHOME(title: 'Shared preferences demo'),
    );
  }
}

class MSAHOME extends StatefulWidget {
  MSAHOME({Key key, this.title}) : super(key: key);
  final String title;
  int _page = 0;
  @override
  _MSAHOME createState() => _MSAHOME();
}

class _MSAHOME extends State<MSAHOME> {
  Future<http.Response> _responseFuture;
  Map themeData;

  @override
  void initState() {
    super.initState();
    //functions.initTheme();
  }
  var jsonCodec = const JsonCodec();
  _setThemeState(ThemeData themedata){
    setState(()=>{
      _themedata: themedata
    });
  }
  @override
  Widget build(BuildContext context) {

     return new Container(
       child: new FutureBuilder<List>(
           future: functions.getTheme(),
           builder: (_,snapshot){
             switch(snapshot.connectionState){
               case ConnectionState.none:
                 errorPage("Error loading data");
                 break;
               case ConnectionState.done:
                 if(snapshot.hasData)
                   return home(snapshot.data[0]);
                 else
                   return errorPage("Error loading data");
                 break;
               default:
                 return loading("");
             }
           }
       )
     );

  }
}

Widget home(Map themeData){
  return  new DefaultTabController(
      length: 4,
      child: new Scaffold(
        drawer: new Drawer(
            child: new ListView(
              children: <Widget> [
                new DrawerHeader(
//                  child: new Text(themeData["name"],style: TextStyle(color: functions.parsehexColor(themeData["primary"]))),
                  child: new Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      CachedNetworkImage(imageUrl: themeData["logo"])
                    ],
                  ),
                  decoration: BoxDecoration(color: functions.parsehexColor(themeData["primary"])),
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
        ),
        body: new NestedScrollView(

          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {

            return <Widget>[
              new SliverAppBar(
                expandedHeight: 200.0,
                pinned: true,
                backgroundColor: functions.parsehexColor(themeData["primary"]),
                title: new Text(themeData["name"],style: TextStyle(color: functions.parsehexColor(themeData["secondary"])),),
                flexibleSpace: new FlexibleSpaceBar(
                  background: new Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      new CachedNetworkImage(
//                        placeholder: CircularProgressIndicator(),
//                        imageUrl:'http://www.luisasempere.com/wp-content/uploads/2017/01/sample-live-galaxy-wallpaper-decoration-themes-motive-adjustable-collection-shocking.png',
//                        imageUrl: 'http://fashion.zarzarmodels.com/wp-content/uploads/2016/03/Beautiful-Brazilian-Fashion-Model-Alessandra-Ambrosio-Modeling-For-The-Italian-Shoe-Label-Cesare-Paciotti-Footwear-Ads-1024x806.jpg',
                        imageUrl: 'https://www.thepixellab.net/wp-content/uploads/2015/07/Free-Cinema4D-3D-Model-Shoe-Sneaker-Sports.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),

                ),
                bottom: new TabBar(
                  labelColor: functions.parsehexColor(themeData["secondary"]),
                  unselectedLabelColor: functions.parsehexColor(themeData["secondary"]).withAlpha(70),
                  tabs: <Tab>[
                    Tab(icon: Icon(Icons.home),text: "Home",),
                    Tab(icon: Icon(Icons.info),text: "About Us",),
                    Tab(icon: Icon(Icons.account_circle),text: "Profile",),
                    Tab(icon: Icon(Icons.notifications),text: "Notification",),
                  ],
                ),

              ),
            ];
          },
          body: new TabBarView(

            children: [
              Products(),
              AboutUs(themeData),
              Profile(),
              Notifs(),
            ],
          ),

        ),
      )

    );

}

Widget Notifs(){
  Widget titleSection(String title,String description){
    return new Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  return ListView(
    children: <Widget>[
      titleSection("Sample Promo 1","This is sample description"),
      titleSection("Today Sale","This is a sample description"),
    ],
  );
}
Widget Profile(){
  return new Column(
      children: <Widget>[
        new ListTile(
        leading: const Icon(Icons.person),
        title: new TextField(
        decoration: new InputDecoration(
        hintText: "Name",
        ),
        ),
        ),
        new ListTile(
        leading: const Icon(Icons.phone),
        title: new TextField(
        decoration: new InputDecoration(
        hintText: "Phone",
        ),
        ),
        ),
        new ListTile(
        leading: const Icon(Icons.email),
        title: new TextField(
        decoration: new InputDecoration(
        hintText: "Email",
        ),
        ),
        ),
        const Divider(
        height: 1.0,
        ),
        new ListTile(
        leading: const Icon(Icons.label),
        title: const Text('Nick'),
        subtitle: const Text('None'),
        ),
        new ListTile(
        leading: const Icon(Icons.today),
        title: const Text('Birthday'),
        subtitle: const Text('February 20, 1980'),),
        new ListTile(
        leading: const Icon(Icons.group),
        title: const Text('Contact group'),
        subtitle: const Text('Not specified'),
        )
        ],
        );
}
Widget AboutUs(Map data){
  Widget titleSection =  Container(

      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(

                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "About Us",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  return ListView(

    children: <Widget>[
      new Container(
        height: 100.0,
        child: new Image.network(data["logo"],fit: BoxFit.fitHeight,)
      ),

      titleSection,
      new Container(
        padding: const EdgeInsets.all(32.0),
        child: new Text(data["about_us"])
      )
    ],
  );
}
Widget ProductList(BuildContext context,List data){
  Widget titleSection(String name){
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );
  }


  Column buildButtonColumn(IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonSection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButtonColumn(Icons.call, 'CALL'),
        buildButtonColumn(Icons.near_me, 'ROUTE'),
        buildButtonColumn(Icons.share, 'SHARE'),
      ],
    ),
  );


  Widget textSection(String description ) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: new Text(
        description,
        textAlign: TextAlign.left,
      )
    );

  }
  List<Widget> childrens = [];
  data.forEach((val){
    childrens.add(Column(
      children: [
        new Container(
          padding: const EdgeInsets.all(20.0),
          child: Image.network(val["image"]),
        ),
        titleSection(val["name"]),
//        buttonSection,
        textSection(val["description"]),
        new Container(

          child: new MaterialButton(
            minWidth: 500.0,
            onPressed: (){},
            child: new Text("Button"),color: Colors.green,),
        )
      ],
    ));
  });
  return new ListView(
    children: childrens,
  );
}

Widget Products(){

  return new FutureBuilder(
      future: functions.getProducts(),
      builder: (_,snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
            errorPage("Error loading data");
            break;
          case ConnectionState.done:
            if(snapshot.hasData)
              return ProductList(_, snapshot.data);
            else
              return errorPage("Error loading data");
            break;
          default:
            return loading("");
        }
      }
  );
}
Widget errorPage(String msg){
  return new Scaffold(
      body: Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.alarm),
            new Text(msg)
          ],
        ),
      )
  );
}
Widget loading(String msg){
  return new Scaffold(
    body: Center(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new CircularProgressIndicator(),
          new Text("Loading...")
        ],
      ),
    )
  );
}

//var html = '<h1>Sample</h1><p>Hey this is only a <b>sample</b></p><ul><li>sample</li><li>text</li></ul>';
//String markdown = html2md.convert(html);
//return MarkdownBody(
//data: markdown
//);

//MyTabController(variables.themeData)

//new Center(
//child: new Column(
//
//mainAxisAlignment: MainAxisAlignment.center,
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//new CircleAvatar(
//backgroundImage: CachedNetworkImageProvider(themeData["logo"])
//)
//],
//),
//)
