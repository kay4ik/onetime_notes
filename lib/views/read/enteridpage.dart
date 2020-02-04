import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:onetime_notes/generated/i18n.dart';
import 'package:onetime_notes/services/database.dart';
import 'package:onetime_notes/views/read/viewnotepage.dart';

class EnterIDpage extends StatefulWidget {
  final String id;
  EnterIDpage({Key key, this.id}) : super(key: key);

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
    _controller.addListener(() => setState(() {}));
    if (widget.id != null) {
      _controller.text = widget.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text(I18n.of(context).openNote),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.content_paste),
            onPressed: _paste,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4),
        child: Column(
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: I18n.of(context).noteID,
                        hintText: "ABcDef1gH2Ijq3rsTuvW",
                        errorText: error,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(I18n.of(context).openNoteInfotext),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Builder(
              builder: (_) => _loading
                  ? CircularProgressIndicator()
                  : FloatingActionButton.extended(
                      icon: Icon(Icons.open_in_new),
                      label: Text(I18n.of(context).openNoteButtontext),
                      backgroundColor:
                          _controller.text.isEmpty ? Colors.grey : null,
                      onPressed: _controller.text.isEmpty ? null : readDatabase,
                    ),
            ),
            SizedBox(height: 16),
            NativeAdmobBannerView(
              adUnitID: "ca-app-pub-8579503352749283/3799878478",
            ),
          ],
        ),
      ),
    );
  }

  String get error {
    return _controller.text.isEmpty ? I18n.of(context).enterIDPlease : null;
  }

  void _paste() async {
    var text = await Clipboard.getData("text/plain");
    _controller.text = text.text;
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
    } else {
      var snackbar = SnackBar(
        content: Text(I18n.of(context).openNoteError),
        backgroundColor: Theme.of(context).errorColor,
      );
      _scaffold.currentState.showSnackBar(snackbar);
    }
    setState(() {
      _loading = false;
    });
  }
}
