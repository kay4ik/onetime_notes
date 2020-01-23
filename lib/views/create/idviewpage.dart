import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onetime_notes/generated/i18n.dart';
import 'package:onetime_notes/link.dart';
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
        title: Text(I18n.of(context).createdNote),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(0),
              child: ListTile(
                leading: Icon(Icons.title),
                title: Text(widget.subject),
              ),
            ),
            SizedBox(height: 8),
            Card(
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.assignment),
                      title: SelectableText(
                        widget.id,
                        style: Theme.of(context).textTheme.title.merge(
                            TextStyle(color: Theme.of(context).accentColor)),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        OutlineButton.icon(
                          icon: Icon(Icons.content_copy),
                          label: Text(I18n.of(context).copyID),
                          onPressed: copy,
                        ),
                        RaisedButton.icon(
                          icon: Icon(Icons.share),
                          label: Text(I18n.of(context).shareLink),
                          onPressed: share,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(I18n.of(context).createNoteFinInfo)
          ],
        ),
      ),
    );
  }

  void copy() {
    Clipboard.setData(ClipboardData(text: widget.id));
    var snackbar = SnackBar(
      content: Text(I18n.of(context).copiedID),
      duration: Duration(seconds: 1),
      backgroundColor: Theme.of(context).accentColor,
    );
    _scaffold.currentState.showSnackBar(snackbar);
  }

  void share() async {
    final params = DynamicLinkParameters(
      androidParameters: androidParams,
      iosParameters: iosParams,
      socialMetaTagParameters: socialMetaParams,
      uriPrefix: uriPrefix,
      link: Uri.parse("https://otn.thezoey.de/note?id=" + widget.id),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
    );
    var link = await params.buildShortLink();
    await Share.share(
      link.shortUrl.toString() + I18n.of(context).link_content + widget.id,
      subject: I18n.of(context).link_subject,
    );
  }
}
