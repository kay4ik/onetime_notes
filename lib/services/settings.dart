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
      _prefs.setInt("OTN_THEMEMODE", ThemeMode.values.indexOf(value));
  ThemeMode get themeMode =>
      ThemeMode.values.elementAt(_prefs.getInt("OTN_THEMEMODE") ?? 0);

  set createUser(bool value) => _prefs.setBool("OTN_createUser", value);
  bool get createUser => _prefs.getBool("OTN_createUser") ?? true;
  
  //bool _isAvailable(String key) => _prefs?.get(key) != null;

  Brightness appBrightness(BuildContext context) {
    switch (themeMode) {
      case ThemeMode.dark:
        return Brightness.dark;
      case ThemeMode.light:
        return Brightness.light;
      default:
        return MediaQuery.of(context).platformBrightness;
    }
  }
}
