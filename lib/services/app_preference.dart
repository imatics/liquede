import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:liquede/model/api_response.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:liquede/extensions/string.dart';


class AppPreference with ChangeNotifier{
  AppPreference(this._preferences);

  static Future<AppPreference> getInstance() async {
    if (_instance != null) {
      return _instance!;
    } else {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      return AppPreference(_preferences);
    }
  }

  factory AppPreference.I(BuildContext context){
    return Provider.of<AppPreference>(context, listen: false);
  }

   Future<bool> clearPref() async {
    return await _preferences.clear();
  }

  static  AppPreference? _instance;
  SharedPreferences _preferences;

  static const String loggedIn = "logged_In";
  static const String password_key = "password-key";
  static const String firstName = "firstName";
  static const String lastName = "surname";
  static const String phoneNumber = "phone";
  static const String gender = "gender";
  static const String picture = "picture";

  static const String email = "email";
  static const String fullName = 'fullName';
  static const String userId = "userId";
  static const String firstLaunch = "fisrt_launch";
  static const String nok = "nok";
  static const String nokPhone = "nokPhone";

  bool getBool(String key, {bool? defValue}) {
    return _preferences.getBool(key) == null
        ? (defValue ?? false)
        : _preferences.getBool(key)!;
  }

  void saveObject(String name, BaseModel model){
    String jsonString = json.encode(model.toJSON());
    setPref(name, jsonString);
  }

  BaseModel<T>? getObject<T>(String name, BaseModel<T> model){
    String? jsonString = getString(name);
    if(jsonString == null){
      return null;
    }
    Map jsonMap = json.decode(jsonString);
    BaseModel<T>? data;
    try {
      data = model.fromJSON(jsonMap) as BaseModel<T>;
    }catch(e, s){
      e.log;
      s.log;
    }
    return data;
  }

  String? getString(String key) {
    return _preferences.getString(key);
  }

  int? getInt(String key) {
    return _preferences.getInt(key);
  }

  void setPref(String key, String value) {
    _preferences.setString(key, value);
  }

  void setBoolPref(String key, bool value) {
    _preferences.setBool(key, value);
  }

  void setListPref(String key, List<String> value) {
    _preferences.setStringList(key, value);
  }

  List<String> getListPref(String key) {
   return _preferences.getStringList(key)??[];
  }

  void setInt(String key, int value) {
    _preferences.setInt(key, value);
  }

  void setDouble(String key, double value) {
    _preferences.setDouble(key, value);
  }

  double getDouble(String key) {
    return _preferences.getDouble(key)??0;
  }

  set username(String value)=> _preferences.setString("username", value);
  String get username => _preferences.getString("username")??"";


  set password(String value)=> _preferences.setString("password", value);
  String get password => _preferences.getString("password")??"";

  set token(String value)=> _preferences.setString("token", value);
  String get token => _preferences.getString("token")??"";

  set seenAppTour(bool value)=> _preferences.setBool("seenAppTour", value);
  bool get seenAppTour => _preferences.getBool("seenAppTour")??false;


  set biometricEnabled(bool value)=> _preferences.setBool("biometric", value);
  bool get biometricEnabled => _preferences.getBool("biometric")??false;




  void saveToken(){}

  void saveRefreshToken(){}

  void updateUserDetails() {
    //TODO no endpoint available for updating user profile
  }

  void changePassword() {
    //TODO no endpoint available for changing user password
  }

  void _hasLoggedIn(bool isLoggedIn) {
    _preferences.setBool(loggedIn, isLoggedIn);
  }

  bool _isLoggedIn() {
    return _preferences.getBool(loggedIn)??false;
  }

  bool get hasLoggedIn => _isLoggedIn();

  set hasLoggedIn(bool e)=> _hasLoggedIn(e);



    bool get hasSeenDashboard => _preferences.getBool("hasSeenDashboard")??false;

  set hasSeenDashboard(bool e)=> _preferences.setBool("hasSeenDashboard", e);
}
