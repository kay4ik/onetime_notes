import 'package:flutter/material.dart';
import 'package:onetime_notes/views/info/components/infocard.dart';
import 'package:undraw/undraw.dart';
import 'package:page_view_indicators/page_view_indicators.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key key}) : super(key: key);

  final _controller = PageController();
  final _notifierer = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Information"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 8),
              child: CirclePageIndicator(
                currentPageNotifier: _notifierer,
                itemCount: 3,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PageView(
                  controller: _controller,
                  onPageChanged: (i) {
                    _notifierer.value = i;
                  },
                  children: <Widget>[
                    Infocard(
                      illustration: UnDrawIllustration.share,
                      title: "Selbstzerstörende Nachrichten",
                      info: info1,
                    ),
                    Infocard(
                      illustration: UnDrawIllustration.safe,
                      title: "Keine Wiederherstellung",
                      info: info2,
                    ),
                    Infocard(
                      illustration: UnDrawIllustration.personalization,
                      title: "Keine Datensammlung",
                      info: info3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  final info1 = """
Du hast die Möglichkeit Nachrichten zu erstellen, die entgültig gelöscht werden sobald sie gelesen werden. 
Nachdem du die Nachricht erstellt hast erhälst du den Code der Nachricht. Teile diesen Code mit dem Empfänger, damit er die Nachricht öffnen kann.
""";

  final info2 = """
Wurde eine Nachricht einmal geöffnet, ist sie für immer gelöscht! Es gibt keine Möglichkeit mehr (für niemanden) diese Daten wiederherzustellen.
Als ersteller einer Nachricht kannst du sie auch löschen bevor sie gelesen wurden.
""";

  final info3 = """
Wir sammeln keine Daten von dir oder deinem Smartphone! Wir erstellen eine Anonyme ID um zu identifizieren, welche Nachrichten von dir erstellt wurden.
Diese ID ist für niemenden ersichtlich! Falls du dies trotzdem nicht möchtest kannst du diese ID in den Einstellungen deaktivieren.
""";
}
