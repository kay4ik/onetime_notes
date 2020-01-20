import 'package:flutter/material.dart';
import 'package:onetime_notes/services/userRepository.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({Key key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    this._init().then((_) {
      Future.delayed(Duration(milliseconds: 1300)).then((_) {
        Navigator.of(context).pushReplacementNamed("/start");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Align(
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/logo.png",
                width: 200,
              ),
            ),
            Center(
              child: SizedBox(
                width: 180,
                height: 180,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green[900]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _init() async {
    UserRepository().signInAnonymous();
    return Future;
  }
}
