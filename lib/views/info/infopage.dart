import 'dart:async';
import 'package:flutter/material.dart';
import 'package:onetime_notes/generated/i18n.dart';
import 'package:onetime_notes/views/info/components/infocard.dart';
import 'package:undraw/undraw.dart';
import 'package:page_view_indicators/page_view_indicators.dart';

class Infopage extends StatefulWidget {
  final int page;
  Infopage({Key key, this.page = 0}) : super(key: key);

  @override
  _InfopageState createState() => _InfopageState();
}

class _InfopageState extends State<Infopage> {
  final _controller = PageController();
  final _notifierer = ValueNotifier<int>(0);

  @override
  void initState() { 
    super.initState();
    Timer(Duration(milliseconds: 200), () {
      _controller.animateToPage(widget.page, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Information"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 8),
              child: CirclePageIndicator(
                currentPageNotifier: _notifierer,
                itemCount: 3,
                selectedDotColor: Theme.of(context).accentColor,
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
                      title: I18n.of(context).INFO_oneTitle,
                      info: I18n.of(context).INFO_one,
                    ),
                    Infocard(
                      illustration: UnDrawIllustration.safe,
                      title: I18n.of(context).INFO_twoTitle,
                      info: I18n.of(context).INFO_two,
                    ),
                    Infocard(
                      illustration: UnDrawIllustration.personalization,
                      title: I18n.of(context).INFO_threeTitle,
                      info: I18n.of(context).INFO_three,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
