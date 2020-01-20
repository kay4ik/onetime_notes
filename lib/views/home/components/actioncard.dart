import 'package:flutter/material.dart';
import 'package:undraw/undraw.dart';

class ActionCard extends StatelessWidget {
  final UnDrawIllustration pic;
  final String title;
  final void Function() onPressed;
  const ActionCard({Key key, this.pic, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                this.title,
                style: Theme.of(context).textTheme.headline,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  UnDraw(
                    illustration: this.pic,
                    width: MediaQuery.of(context).size.width/2,
                    height: MediaQuery.of(context).size.height/6,
                    color: Colors.green,
                    fit: BoxFit.fitWidth,
                  ),
                  Icon(Icons.chevron_right)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
