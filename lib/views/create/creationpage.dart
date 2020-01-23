import 'package:flutter/material.dart';
import 'package:onetime_notes/models/note.dart';
import 'package:onetime_notes/services/crypter.dart';
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
  var _passwordF = TextEditingController();

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
                        controller: _passwordF,
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
    _changeLoading();
    var uid = await UserRepository().userID();
    checkCryption().then((content) async {
      var note = Note(
        subject: _subjectF.text,
        content: content,
        userid: uid,
        create: DateTime.now(),
        crypted: _passwordF.text.isNotEmpty,
      );
      var id = await Database().pushNote(note);
      _changeLoading();
      var route = MaterialPageRoute(
          builder: (_) => IDViewpage(
                id: id,
                subject: note.subject,
              ),
          fullscreenDialog: true);
      await Navigator.of(context).push(route);
      Navigator.pop(context);
    });
  }

  Future<String> checkCryption() async {
    if (_passwordF.text.isNotEmpty) {
      final content = Crypter().encrypt(_contentF.text, _passwordF.text);
      return content;
    } else
      return _contentF.text;
  }

  void _changeLoading() {
    setState(() {
      loading = !loading;
    });
  }
}
