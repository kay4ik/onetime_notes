import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onetime_notes/generated/i18n.dart';
import 'package:onetime_notes/models/note.dart';
import 'package:onetime_notes/services/database.dart';
import 'package:onetime_notes/services/date_helper.dart';
import 'package:onetime_notes/services/linker.dart';
import 'package:onetime_notes/services/settings.dart';
import 'package:share/share.dart';

class Notelistpage extends StatefulWidget {
  Notelistpage({Key key}) : super(key: key);

  @override
  _NotelistpageState createState() => _NotelistpageState();
}

class _NotelistpageState extends State<Notelistpage> {
  var _scaffold = GlobalKey<ScaffoldState>();
  var _db = Database();
  var _settings = Settings();

  @override
  void initState() {
    super.initState();
    _db.queryMyNotes();
    _db.myNotes.listen((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text(I18n.of(context).unreadNotesTitle),
      ),
      body: _settings.createUser
          ? StreamBuilder(
              stream: _db.myNotes,
              builder: (context, snap) {
                if (snap.hasData) {
                  return ListView.builder(
                      itemCount: snap.data.length + 2,
                      itemBuilder: (context, i) {
                        if (i == 0) {
                          return NativeAdmobBannerView(
                            adUnitID: "ca-app-pub-8579503352749283/3799878478",
                            showMedia: false,
                          );
                        } else if (i == 1) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(I18n.of(context).unreadNotesInfo),
                              ),
                            ),
                          );
                        } else {
                          var note = snap.data[i - 2] as Note;
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Card(
                              child: ListTile(
                                title: Text(note.subject.isNotEmpty ? note.subject : I18n.of(context).noSubject),
                                subtitle: Text(DateHelper.writeDate(note.create)),
                                trailing: IconButton(
                                  icon: Icon(MdiIcons.fileSettingsOutline),
                                  onPressed: () => show(note),
                                ),
                              ),
                            ),
                          );
                        }
                      });
                } else
                  return Center(child: CircularProgressIndicator());
              })
          : Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                color: Theme.of(context).errorColor,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(I18n.of(context).unreadNotesError),
                ),
              ),
            ),
    );
  }

  void show(Note note) {
    showDialog(
        context: _scaffold.currentContext,
        builder: (_) {
          return Center(
            child: Card(
              margin: EdgeInsets.all(26),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(MdiIcons.notebookOutline),
                    title: Text(note.subject.isNotEmpty ? note.subject : I18n.of(context).noSubject),
                    subtitle: Text(note.crypted
                        ? I18n.of(context).crypted
                        : I18n.of(context).cryptedNot),
                  ),
                  Divider(),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        OutlineButton.icon(
                          icon: Icon(Icons.content_copy),
                          label: Text(I18n.of(context).copyID),
                          onPressed: () => copyID(note),
                        ),
                        RaisedButton.icon(
                          icon: Icon(MdiIcons.share),
                          label: Text(I18n.of(context).shareLink),
                          onPressed: () => share(note),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Center(
                    child: FlatButton.icon(
                      icon: Icon(MdiIcons.deleteForever),
                      label: Text(I18n.of(context).delete),
                      textColor: Colors.red,
                      onPressed: () => _db.deleteNote(note.id),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void copyID(Note note) {
    Navigator.of(context).pop();
    var data = ClipboardData(text: note.id);
    Clipboard.setData(data);
    _scaffold.currentState.showSnackBar(SnackBar(
      content: Text(I18n.of(context).copiedID),
      backgroundColor: Theme.of(context).accentColor,
    ));
  }

  void share(Note note) async {
    var link = await Linker.instance.buildDynamicLink(note);
    await Share.share(
      link.toString() + I18n.of(context).link_content + note.id,
      subject: I18n.of(context).link_subject,
    );
  }
}
