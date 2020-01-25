import 'package:flutter/material.dart';
import 'package:undraw/undraw.dart';

class ActionCard extends StatelessWidget {
  final UnDrawIllustration pic;
  final String title;
  final void Function() onPressed;
  final double height;
  final Widget offline;
  const ActionCard({Key key, this.pic, this.title, this.onPressed, this.height, this.offline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: height,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      color: Colors.green,
                      height: height * 0.4,
                      fit: BoxFit.contain,
                      errorWidget: offline,
                    ),
                    Icon(Icons.chevron_right)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
