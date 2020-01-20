import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onetime_notes/appBuilder.dart';
import 'package:onetime_notes/services/settings.dart';
import 'package:onetime_notes/views/create/creationpage.dart';
import 'package:onetime_notes/views/home/homepage.dart';
import 'package:onetime_notes/views/info/infopage.dart';
import 'package:onetime_notes/views/list/listview.dart';
import 'package:onetime_notes/views/read/enteridpage.dart';
import 'package:onetime_notes/views/settings/settingpage.dart';
import 'package:onetime_notes/views/splash/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Settings().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBuilder(
      builder: (key, context) => MaterialApp(
        key: key,
        title: 'Onetime Notes',
        themeMode: Settings().themeMode,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.green[800],
          buttonColor: Colors.green[800],
        ),
        theme: ThemeData(
          brightness: Brightness.light,
          accentColor: Colors.green,
          appBarTheme: AppBarTheme(
            color: Colors.green[800],
          ),
          buttonColor: Colors.green,
        ),
        home: Splashscreen(),
        routes: {
          "/start" : (_) => Homepage(),
          "/start/settings" : (_) => Settingpage(),
          "/start/info" : (_) => InfoPage(),
          "/create" : (_) => Creationpage(),
          "/read" : (_) => EnterIDpage(),
          "/list" : (_) => Notelistpage(),
        },
      ),
    );
  }
}
