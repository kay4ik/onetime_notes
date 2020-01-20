import 'package:flutter/material.dart';
import 'package:onetime_notes/models/note.dart';
import 'package:onetime_notes/services/database.dart';
import 'package:onetime_notes/services/userRepository.dart';
import 'package:onetime_notes/views/create/idviewpage.dart';

class Creationpage extends StatefulWidget {
  Creationpage({Key key}) : super(key: key);

  @override
  _CreationpageState createState() => _CreationpageState();
}

class _CreationpageState extends State<Creationpage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var optionsExpanded = false;
  var loading = false;

  var _subjectF = TextEditingController();
  var _contentF = TextEditingController();

  @override
  void initState() {
    super.initState();
    _subjectF.addListener(() {
      setState(() {});
    });
    _contentF.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Neue Notiz"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: validate,
          )
        ],
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              key: _scaffoldKey,
              padding: EdgeInsets.all(12),
              children: <Widget>[
                TextField(
                  controller: _subjectF,
                  maxLength: 30,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Betreff eingeben",
                    hintText: "Der Betreff ist lesbar!",
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: _contentF,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  minLines: 7,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nachricht schreiben",
                    hintText: "Hallo, dies sind die vetraulichen Daten...",
                  ),
                ),
                SizedBox(height: 12),
                ExpansionTile(
                  title: Text("Optionen"),
                  leading: Icon(Icons.settings),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Passwort festlegen"),
                      ),
                    )
                  ],
                )
              ],
            ),
    );
  }

  void validate() {
    if (_subjectF.text.isNotEmpty && _contentF.text.isNotEmpty)
      send();
    else {
      var snackbar = SnackBar(
        content: Text("Fülle den Betreff und die Nachhricht aus."),
        backgroundColor: Theme.of(context).errorColor,
      );
      Scaffold.of(_scaffoldKey.currentContext).showSnackBar(snackbar);
    }
  }

  void send() async {
    setState(() {
      loading = true;
    });
    var uid = await UserRepository().userID();
    var note = Note(
        subject: _subjectF.text,
        content: _contentF.text,
        userid: uid,
        create: DateTime.now());
    var id = await Database().pushNote(note);
    setState(() {
      loading = false;
    });
    var route = MaterialPageRoute(
        builder: (_) => IDViewpage(
              id: id,
              subject: note.subject,
            ),
        fullscreenDialog: true);
    await Navigator.of(context).push(route);
    Navigator.pop(context);
  }
}
