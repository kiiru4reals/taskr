import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/features/settings/domain/settings_usecase.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({Key? key}) : super(key: key);

  @override
  _GeneralSettingsState createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "General",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.black12,
            child: InkWell(
              onTap: () {},
              child: ListTile(
                onTap: () {},
                title: Text(
                  "Alert style ",
                ),
                subtitle: Text(
                  "Medium",
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ),
          ),
        ),
        ListTileSwitch(
          value: provider.showreminderonappScreen,
          onChanged: (value) {
            setState(() {
              provider.showreminderonappScreen = value;
            });
          },
          switchActiveColor: Colors.indigo,
          title: Text("Show reminder on app screen"),
        ),
        Divider(),
      ],
    );
  }
}
