import 'package:flutter/material.dart';

class AppBuilder extends StatefulWidget {
  const AppBuilder({Key key, this.builder}) : super(key: key);
  final Function(Key, BuildContext) builder;

  @override
  AppBuilderState createState() => new AppBuilderState();

  static AppBuilderState of(BuildContext context) {
    return context.findAncestorStateOfType<AppBuilderState>();
  }
}

class AppBuilderState extends State<AppBuilder> {
  Key key = new UniqueKey();

  @override
  Widget build(BuildContext context) {
    return widget.builder(this.key, context);
  }

  /// Silent Rebuild of the App. The User stays on the same Screen.
  void rebuild() {
    setState(() {});
  }

  /// App Restarts completly! The User is going to the InitScreen!
  void restart() {
    setState(() {
      key = new UniqueKey();
    });
  }
}