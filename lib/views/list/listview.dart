import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onetime_notes/generated/i18n.dart';
import 'package:onetime_notes/models/note.dart';
import 'package:onetime_notes/services/database.dart';
import 'package:onetime_notes/services/date_helper.dart';
import 'package:onetime_notes/services/settings.dart';

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
      body: _settings.createUser ? StreamBuilder(
        stream: _db.myNotes,
        builder: (context, snap) {
          if (snap.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: snap.data.length + 1,
              itemBuilder: (context, i) {
                if (i == 0) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(I18n.of(context).unreadNotesInfo),
                    ),
                  );
                } else {
                  var note = snap.data[i - 1];
                  return Card(
                    child: ListTile(
                      title: Text(note.subject),
                      subtitle: Text(DateHelper.writeDate(note.create)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.content_copy),
                            onPressed: () => copyID(note),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_forever),
                            color: Colors.red,
                            onPressed: () => _db.deleteNote(note.id),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      )
      : Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          color: Theme.of(context).errorColor,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(I18n.of(context).unreadNotesError),
          ),
        ),
      )
    );
  }

  void copyID(Note note) {
    var data = ClipboardData(text: note.id);
    Clipboard.setData(data);
    _scaffold.currentState.showSnackBar(
      SnackBar(
        content: Text(I18n.of(context).copiedID),
        backgroundColor: Theme.of(context).accentColor,
        action: SnackBarAction(
          label: I18n.of(context).show,
          onPressed: () {
            showDialog(
              context: _scaffold.currentContext,
              builder: (context) {
                return AlertDialog(
                  title: Text(note.subject),
                  content: SelectableText(note.id),
                );
              }
            );
          },
        ),
      )
    );
  }
}