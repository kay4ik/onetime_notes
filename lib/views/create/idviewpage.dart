import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onetime_notes/generated/i18n.dart';
import 'package:onetime_notes/models/note.dart';
import 'package:onetime_notes/services/linker.dart';
import 'package:share/share.dart';

class IDViewpage extends StatefulWidget {
  final Note note;
  final String subject;
  IDViewpage({Key key, this.note, this.subject}) : super(key: key);

  @override
  _IDViewpageState createState() => _IDViewpageState();
}

class _IDViewpageState extends State<IDViewpage> {
  var _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text(I18n.of(context).createdNote),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(0),
              child: ListTile(
                leading: Icon(Icons.title),
                title: Text(widget.subject),
              ),
            ),
            SizedBox(height: 8),
            Card(
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.assignment),
                      title: SelectableText(
                        widget.note.id,
                        style: Theme.of(context).textTheme.title.merge(
                            TextStyle(color: Theme.of(context).accentColor)),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        OutlineButton.icon(
                          icon: Icon(Icons.content_copy),
                          label: Text(I18n.of(context).copyID),
                          onPressed: copy,
                        ),
                        RaisedButton.icon(
                          icon: Icon(MdiIcons.share),
                          label: Text(I18n.of(context).shareLink),
                          onPressed: share,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(I18n.of(context).createNoteFinInfo)
          ],
        ),
      ),
    );
  }

  void copy() {
    widget.note.copyIDToClipboard();
    var snackbar = SnackBar(
      content: Text(I18n.of(context).copiedID),
      backgroundColor: Theme.of(context).accentColor,
    );
    _scaffold.currentState.showSnackBar(snackbar);
  }

  void share() async {
    var link = await Linker.instance.buildDynamicLink(Note.idOnly(widget.note.id));
    await Share.share(
      link.toString() + I18n.of(context).link_content + widget.note.id,
      subject: I18n.of(context).link_subject,
    );
  }
}
