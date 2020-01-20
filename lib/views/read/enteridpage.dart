import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onetime_notes/services/database.dart';
import 'package:onetime_notes/views/read/viewnotepage.dart';

class EnterIDpage extends StatefulWidget {
  EnterIDpage({Key key}) : super(key: key);

  @override
  _EnterIDpageState createState() => _EnterIDpageState();
}

class _EnterIDpageState extends State<EnterIDpage> {
  var _loading = false;
  var _controller = TextEditingController();
  final _scaffold = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState((){}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text("Notiz öffnen"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.content_paste),
            onPressed: _paste,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Notiz ID",
                hintText: "ABcDef1gH2Ijq3rsTuvW",
                errorText: error,
              ),
            ),
            SizedBox(height: 12),
            Card(
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Wenn Sie fortfahren, wird die Nachricht aus der Datenbank gelöscht und kann nicht Wiederhergestellt werden."),
              ),
            ),
            SizedBox(height: 12),
            Builder(builder: (_) {
              return _loading
                  ? CircularProgressIndicator()
                  : FloatingActionButton.extended(
                      icon: Icon(Icons.open_in_new),
                      label: Text("Öffnen und löschen"),
                      onPressed: openAndDelete,
                    );
            })
          ],
        ),
      ),
    );
  }

  String get error {
    return _controller.text.isEmpty
    ? "Bitte ID einfügen"
    : null;
  }

  void _paste() async {
    var text = await Clipboard.getData("text/plain");
    _controller.text = text.text;
  }

  void openAndDelete() async {
    if (_controller.text.isNotEmpty) readDatabase();
    else {
      var snackbar = SnackBar(
        content: Text("Füge die ID ein, um eine Notiz zu öffnen."),
        backgroundColor: Theme.of(context).accentColor,
      );
      _scaffold.currentState.showSnackBar(snackbar);
    }
  }

  void readDatabase() async {
    setState(() {
      _loading = true;
    });
    var note = await Database().readNote(_controller.text);
    if (note != null) {
      var route = MaterialPageRoute(
        builder: (_) => ViewNotepage(note: note),
      );
      await Navigator.of(context).push(route);
      Navigator.pop(context);
    }
    else {
      var snackbar = SnackBar(
        content: Text("Diese ID ist falsch, oder die Notiz wurde bereits gelöscht."),
        backgroundColor: Theme.of(context).errorColor,
      );
      _scaffold.currentState.showSnackBar(snackbar);
    }
    setState(() {
      _loading = false;
    });
  }
}
