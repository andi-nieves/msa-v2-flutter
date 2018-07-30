import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'variables.dart';
import '../config.dart';

class AppStorage{

  static Future<List> getTheme() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(variables.themes));
  }
  static setTheme(value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(variables.themes, value);
  }
  static Future<List> getStorageData(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("$key >>>" + prefs.getString(key));
    return json.decode(prefs.getString(key));
  }
  static setStorage(String key,String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

}