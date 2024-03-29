import 'package:flutter/material.dart';
import 'package:onetime_notes/services/settings.dart';
import 'package:onetime_notes/services/userRepository.dart';
import 'package:onetime_notes/views/read/enteridpage.dart';

class Splashscreen extends StatefulWidget {
  final Uri link;
  Splashscreen({Key key, this.link}) : super(key: key);

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
        if (widget.link != null) {
          print("RECIVED!!! App opened with link: " + widget.link.toString());
          var id = widget.link.queryParameters["id"];
          print("ID IS:" + id);
          var route = MaterialPageRoute(builder: (_) => EnterIDpage(id: id));
          Navigator.of(context).push(route);
        }
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
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset("assets/icon.png"),
                    ),
                    Text(
                      "Onetime Notes",
                      style: TextStyle(
                        color: Colors.green[600],
                        fontSize: 25,
                        fontFamily: "Montserrat",
                      ),
                    )
                  ],
                ),
              ),
            ),
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
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green[600]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _init() async {
    await UserRepository().init(Settings().createUser);
    return Future;
  }
}
