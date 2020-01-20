import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onetime_notes/appBuilder.dart';
import 'package:onetime_notes/services/settings.dart';

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
        title: Text("Einstellungen"),
      ),
      body: Column(
        children: <Widget>[
          ExpansionTile(
            title: Text("Darstellung"),
            leading: Icon(MdiIcons.themeLightDark),
            children: <Widget>[
              ListTile(
                title: Text("Modus"),
                trailing: DropdownButton(
                  value: Settings().themeMode,
                  onChanged: (v){
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
              ),
            ],
          ),
          ExpansionTile(
            title: Text("Datenschutz"),
            leading: Icon(Icons.security),
            children: <Widget>[
              ListTile(
                title: Text("Nutzer ID erstellen"),
                leading: Icon(MdiIcons.accountBadge),
                trailing: Switch(
                  value: true,
                  onChanged: (_) {},
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                leading: Icon(MdiIcons.accountRemove),
                title: Text("Nutzerdaten löschen"),
                trailing: Icon(Icons.chevron_right),
              ),
              ListTile(
                leading: Icon(MdiIcons.informationVariant),
                title: Text("Informationen dazu"),
                trailing: Icon(Icons.chevron_right),
              ),
            ],
          )
        ],
      ),
    );
  }
}
