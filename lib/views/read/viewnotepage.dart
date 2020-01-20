import 'package:flutter/material.dart';
import 'package:onetime_notes/models/note.dart';
import 'package:onetime_notes/services/date_helper.dart';

class ViewNotepage extends StatefulWidget {
  final Note note;
  ViewNotepage({Key key, @required this.note}) : super(key: key);

  @override
  _ViewNotepageState createState() => _ViewNotepageState();
}

class _ViewNotepageState extends State<ViewNotepage> {
  var _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.note.content;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note.subject),
      ),
      body: ListView(
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
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ),
                  SizedBox(height: 8),
                  SelectableText(
                    widget.note.content,
                    style: Theme.of(context).textTheme.title,
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
}
