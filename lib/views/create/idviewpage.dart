import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class IDViewpage extends StatefulWidget {
  final String id;
  final String subject;
  IDViewpage({Key key, this.id, this.subject}) : super(key: key);

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
        title: Text("Notiz erstellt"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.title),
                title: Text(widget.subject),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.assignment),
                      title: SelectableText(
                        widget.id,
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .merge(TextStyle(color: Colors.blue)),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.content_copy),
                          onPressed: copy,
                        ),
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: share,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Sende die ID an den Empfänger! Die Nachricht wird gelöscht sobald die Nachricht vom Empfänger geöffnet wird.",
            )
          ],
        ),
      ),
    );
  }

  void copy() {
    Clipboard.setData(ClipboardData(text: widget.id));
    var snackbar = SnackBar(
      content: Text("Kopiert!"),
      duration: Duration(seconds: 1),
      backgroundColor: Theme.of(context).accentColor,
    );
    _scaffold.currentState.showSnackBar(snackbar);
  }

  void share() async {
    await Share.share(
      "Die ID der Nachricht ist: " + widget.id,
      subject: "Neue Ontime Notiz erstellt!",
    );
  }
}
