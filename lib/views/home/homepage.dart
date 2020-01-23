import 'package:flutter/material.dart';
import 'package:onetime_notes/generated/i18n.dart';
import 'package:onetime_notes/views/home/components/actioncard.dart';
import 'package:undraw/undraw.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          I18n.of(context).appTitle,
          style: TextStyle(letterSpacing: 2, ),
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
            title: I18n.of(context).createNote,
            onPressed: () => Navigator.of(context).pushNamed("/create"),
          ),
          ActionCard(
            pic: UnDrawIllustration.reading_list,
            title: I18n.of(context).openNote,
            onPressed: () => Navigator.of(context).pushNamed("/read"),
          ),
          ActionCard(
            pic: UnDrawIllustration.note_list,
            title: I18n.of(context).unreadNotes,
            onPressed: () => Navigator.of(context).pushNamed("/list"),
          ),
        ],
      ),
    );
  }
}
