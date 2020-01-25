import 'dart:async';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onetime_notes/appBuilder.dart';
import 'package:onetime_notes/generated/i18n.dart';
import 'package:onetime_notes/services/settings.dart';
import 'package:onetime_notes/views/create/creationpage.dart';
import 'package:onetime_notes/views/home/homepage.dart';
import 'package:onetime_notes/views/info/infopage.dart';
import 'package:onetime_notes/views/list/listview.dart';
import 'package:onetime_notes/views/read/enteridpage.dart';
import 'package:onetime_notes/views/settings/settingpage.dart';
import 'package:onetime_notes/views/splash/splashscreen.dart';

import 'link.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Settings().init();
  await retrieveDynamicLink();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Timer _timerLink;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    FirebaseDynamicLinks.instance.onLink(onSuccess: _onLink);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _timerLink = Timer(const Duration(milliseconds: 1000), () {
        retrieveDynamicLink();
      });
    }
  }

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
          platform: TargetPlatform.iOS,
        ),
        theme: ThemeData(
          brightness: Brightness.light,
          accentColor: Colors.green,
          appBarTheme: AppBarTheme(
            color: Colors.green[800],
          ),
          buttonColor: Colors.green,
          platform: TargetPlatform.iOS,
        ),
        home: Splashscreen(link: initialLink),
        routes: {
          "/start": (_) => Homepage(),
          "/start/settings": (_) => Settingpage(),
          "/start/info": (_) => InfoPage(),
          "/create": (_) => Creationpage(),
          "/read": (_) => EnterIDpage(),
          "/list": (_) => Notelistpage(),
        },
        supportedLocales: [
          Locale('de', ''),
          Locale('en', ''),
        ],
        localizationsDelegates: [
          I18n.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (_timerLink != null) {
      _timerLink.cancel();
    }
    super.dispose();
  }

  Future<dynamic> _onLink(PendingDynamicLinkData data) async {
    print("RECIVED!!! opened restarted with: " + data.link.toString());
    var id = data.link.queryParameters["id"];
    print(id);
    var route = MaterialPageRoute(builder: (_) => EnterIDpage(id: id));
    Navigator.of(context).push(route);
    return Future.value(data.link);
  }
}
