import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onetime_notes/appBuilder.dart';
import 'package:onetime_notes/generated/i18n.dart';
import 'package:onetime_notes/services/settings.dart';
import 'package:onetime_notes/services/userRepository.dart';
import 'package:onetime_notes/views/info/infopage.dart';
import 'package:undraw/undraw.dart';

class Settingpage extends StatefulWidget {
  Settingpage({Key key}) : super(key: key);

  @override
  _SettingpageState createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  var _scaffold = GlobalKey<ScaffoldState>();
  Settings _settings = Settings();
  UserRepository _repo = UserRepository();
  String uid = "";

  @override
  void initState() {
    super.initState();
    _repo.userID().then((val) {
      setState(() {
        uid = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text(I18n.of(context).settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            UnDraw(
              illustration: UnDrawIllustration.settings,
              color: Colors.green,
              height: 200,
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 220),
                  Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            MdiIcons.themeLightDark,
                            color: Colors.green,
                          ),
                          title: Text(
                            I18n.of(context).sThemeoptions,
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                        ListTile(
                          title: Text(I18n.of(context).sThemeSelect),
                          trailing: DropdownButton(
                            value: Settings().themeMode,
                            onChanged: (v) {
                              Settings().themeMode = v;
                              AppBuilder.of(context).rebuild();
                            },
                            items: ThemeMode.values.map((i) {
                              return DropdownMenuItem(
                                value: i,
                                child: Text(i.toString().split('.')[1]),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            MdiIcons.shieldLockOutline,
                            color: Colors.green,
                          ),
                          title: Text(
                            I18n.of(context).sData,
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                        ListTile(
                          leading: Icon(MdiIcons.accountBadge),
                          title: Text(I18n.of(context).sDataUserID),
                          trailing: Switch(
                            value: _settings.createUser,
                            onChanged: changeUserPrivacy,
                            activeColor: Colors.green,
                          ),
                        ),
                        ListTile(
                          leading: Icon(MdiIcons.accountConvert),
                          title: Text(I18n.of(context).sDataRefreshUser),
                          subtitle: uid != null ? Text(uid) : null,
                          trailing: Icon(Icons.chevron_right),
                          onTap: reset,
                        ),
                        ListTile(
                          leading: Icon(MdiIcons.informationVariant),
                          title: Text(I18n.of(context).moreInfo),
                          trailing: Icon(Icons.chevron_right),
                          onTap: moreInfo,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeUserPrivacy(bool value) async {
    var b = await showAlert();
    if (b) {
      _settings.createUser = value;
      AppBuilder.of(_scaffold.currentContext).restart();
    }
  }

  void moreInfo() {
    var route = MaterialPageRoute(builder: (_) => Infopage(page: 2));
    Navigator.push(context, route);
  }

  Future<void> reset() async {
    var b = await showAlert();
    if (b) {
      await _repo.reset();
      AppBuilder.of(context).restart();
    }
  }

  Future<bool> showAlert() async {
    bool b = await showDialog<bool>(
        context: _scaffold.currentContext,
        builder: (context) => AlertDialog(
              title: Text(I18n.of(context).sRestartAlertTitle),
              content: Text(I18n.of(context).sRestartAlertContent),
              actions: <Widget>[
                FlatButton(
                  child: Text(I18n.of(context).cancel),
                  textColor: Theme.of(context).errorColor,
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text("Okay"),
                  textColor: Theme.of(context).accentColor,
                  onPressed: () => Navigator.pop(context, true),
                )
              ],
            ));
    return b;
  }
}
