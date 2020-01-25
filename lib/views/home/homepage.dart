import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onetime_notes/generated/i18n.dart';
import 'package:onetime_notes/views/home/components/actioncard.dart';
import 'package:undraw/undraw.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text(
          I18n.of(context).appTitle,
          style: TextStyle(
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(MdiIcons.settingsOutline),
          onPressed: () => Navigator.of(context).pushNamed("/start/settings"),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => Navigator.of(context).pushNamed("/start/info")),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Builder(
              builder: (context) => ActionCard(
                pic: UnDrawIllustration.add_content,
                title: I18n.of(context).createNote,
                height: (MediaQuery.of(context).size.height -
                        Scaffold.of(context).appBarMaxHeight) /
                    3.15,
                offline: Icon(MdiIcons.notePlusOutline),
                onPressed: () => Navigator.of(context).pushNamed("/create"),
              ),
            ),
            Builder(builder: (context) {
              return ActionCard(
                pic: UnDrawIllustration.reading_list,
                title: I18n.of(context).openNote,
                onPressed: () => Navigator.of(context).pushNamed("/read"),
                offline: Icon(MdiIcons.bookOpenPageVariant),
                height: (MediaQuery.of(context).size.height -
                        Scaffold.of(context).appBarMaxHeight) /
                    3.15,
              );
            }),
            Builder(
              builder: (context) => ActionCard(
                pic: UnDrawIllustration.note_list,
                title: I18n.of(context).unreadNotes,
                height: (MediaQuery.of(context).size.height -
                        Scaffold.of(context).appBarMaxHeight) /
                    3.15,
                offline: Icon(MdiIcons.formatListText),
                onPressed: () => Navigator.of(context).pushNamed("/list"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
