import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onetime_notes/models/note.dart';
import 'package:onetime_notes/services/crypter.dart';
import 'package:onetime_notes/services/date_helper.dart';

class ViewNotepage extends StatefulWidget {
  final Note note;
  ViewNotepage({Key key, @required this.note}) : super(key: key);

  @override
  _ViewNotepageState createState() => _ViewNotepageState();
}

class _ViewNotepageState extends State<ViewNotepage> {
  String content;
  bool crypted;
  bool loading = false;

  var _scaffold = GlobalKey<ScaffoldState>();
  var _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    content = widget.note.content;
    crypted = widget.note.crypted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text(widget.note.subject),
      ),
      body: crypted
          ? Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: loading
                    ? CircularProgressIndicator()
                    : Card(
                        margin: EdgeInsets.all(0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(MdiIcons.shieldLockOutline),
                                title: Text("Mit Passwort verschlüsselt!"),
                              ),
                              TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Passwort eingeben",
                                    hintText: "TheZoey123"),
                              ),
                              SizedBox(height: 8),
                              Wrap(
                                runSpacing: 8,
                                spacing: 8,
                                children: <Widget>[
                                  OutlineButton.icon(
                                    icon: Icon(MdiIcons.sortVariantLock),
                                    label: Text("Verschlüsselt zeigen"),
                                    onPressed: readCrypted,
                                  ),
                                  RaisedButton.icon(
                                    icon: Icon(Icons.lock_open),
                                    label: Text("Entschlüsseln"),
                                    onPressed: decrypt,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
              ),
            )
          : ListView(
              padding: EdgeInsets.all(8),
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Nachricht",
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                        SizedBox(height: 8),
                        SelectableText(
                          content,
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.date_range),
                    title: Text(DateHelper.writeDate(widget.note.create)),
                    subtitle: Text("Nachricht erstellt am"),
                  ),
                )
              ],
            ),
    );
  }

  void decrypt() {
    if (_controller.text.isNotEmpty) {
      _loading();
      try {
        content = Crypter().decrypt(widget.note.content, _controller.text);
        crypted = false;
      } catch (e) {
        crypted = true;
        showErrorPassword();
      }
      _loading();
    }
  }

  void readCrypted() {
    setState(() {
      crypted = false;
    });
  }

  void _loading() {
    setState(() {
      loading = !loading;
    });
  }

  void showErrorPassword() {
    var snackbar = SnackBar(
      content: Text("Entschlüsselung fehlgeschlagen! Passwort falsch?"),
      backgroundColor: Theme.of(context).errorColor,
    );
    _scaffold.currentState.showSnackBar(snackbar);
  }
}
