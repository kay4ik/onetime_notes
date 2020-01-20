import 'package:flutter/material.dart';
import 'package:undraw/undraw.dart';

class Infocard extends StatelessWidget {
  final UnDrawIllustration illustration;
  final String title;
  final String info;
  const Infocard({Key key, this.illustration, this.title, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 200,
          child: UnDraw(
            illustration: this.illustration,
            color: Colors.green,
          ),
        ),
        SizedBox(height: 20),
        Text(
          this.title,
          style: Theme.of(context).textTheme.headline,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          this.info,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
