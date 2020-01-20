import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  SharedPreferences _prefs;

  static Settings _instance = Settings._();
  factory Settings() => _instance;
  Settings._();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    return Future;
  }

  set themeMode(ThemeMode value) =>
      _prefs.setInt("SETTING", ThemeMode.values.indexOf(value));
  ThemeMode get themeMode =>
      ThemeMode.values.elementAt(_prefs.getInt("SETTING") ?? 0);

  

  //bool _isAvailable(String key) => _prefs?.get(key) != null;
}
