import 'package:flutter/material.dart';
import 'package:onetime_notes/views/home/components/actioncard.dart';
import 'package:undraw/undraw.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Onetime Notes",
          style: TextStyle(letterSpacing: 4, ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => Navigator.of(context).pushNamed("/start/settings"),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => Navigator.of(context).pushNamed("/start/info"),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          ActionCard(
            pic: UnDrawIllustration.add_content,
            title: "Neue Notiz erstellen",
            onPressed: () => Navigator.of(context).pushNamed("/create"),
          ),
          ActionCard(
            pic: UnDrawIllustration.reading_list,
            title: "Eine Notiz öffnen",
            onPressed: () => Navigator.of(context).pushNamed("/read"),
          ),
          ActionCard(
            pic: UnDrawIllustration.note_list,
            title: "Ungelesene Notizen",
            onPressed: () => Navigator.of(context).pushNamed("/list"),
          ),
        ],
      ),
    );
  }
}
