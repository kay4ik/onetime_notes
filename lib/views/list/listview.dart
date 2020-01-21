import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onetime_notes/models/note.dart';
import 'package:onetime_notes/services/database.dart';
import 'package:onetime_notes/services/date_helper.dart';

class Notelistpage extends StatefulWidget {
  Notelistpage({Key key}) : super(key: key);

  @override
  _NotelistpageState createState() => _NotelistpageState();
}

class _NotelistpageState extends State<Notelistpage> {
  var _scaffold = GlobalKey<ScaffoldState>();
  var _db = Database();

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
        title: Text("Meine Notizen"),
      ),
      body: StreamBuilder(
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
                      child: Text(info),
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
      ),
    );
  }

  void copyID(Note note) {
    var data = ClipboardData(text: note.id);
    Clipboard.setData(data);
    _scaffold.currentState.showSnackBar(
      SnackBar(
        content: Text("ID kopiert!"),
        backgroundColor: Theme.of(context).accentColor,
        action: SnackBarAction(
          label: "Anzeigen",
          onPressed: () {
            showDialog(
              context: _scaffold.currentContext,
              builder: (context) {
                return AlertDialog(
                  title: Text("ID von "+note.subject),
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

var info = "Hier werden Nachrichten angezeigt, welche du erstellt hast und die noch nicht gelesen wurden.";