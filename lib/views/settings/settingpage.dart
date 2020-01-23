import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onetime_notes/appBuilder.dart';
import 'package:onetime_notes/generated/i18n.dart';
import 'package:onetime_notes/services/settings.dart';
import 'package:undraw/undraw.dart';

class Settingpage extends StatefulWidget {
  Settingpage({Key key}) : super(key: key);

  @override
  _SettingpageState createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            MdiIcons.accountLock,
                            color: Colors.green,
                          ),
                          title: Text(
                            I18n.of(context).sData,
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                        ListTile(
                          title: Text(I18n.of(context).sDataUserID),
                          leading: Icon(MdiIcons.accountBadge),
                          trailing: Switch(
                            value: true,
                            onChanged: (_) {},
                            activeColor: Colors.green,
                          ),
                        ),
                        ListTile(
                          leading: Icon(MdiIcons.accountRemove),
                          title: Text(I18n.of(context).sDataDeleteUser),
                          trailing: Icon(Icons.chevron_right),
                        ),
                        ListTile(
                          leading: Icon(MdiIcons.informationVariant),
                          title: Text(I18n.of(context).moreInfo),
                          trailing: Icon(Icons.chevron_right),
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
}
