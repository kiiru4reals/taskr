import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:soluprov/config.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({Key? key}) : super(key: key);

  @override
  _GeneralSettingsState createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  @override
  Widget build(BuildContext context) {
    bool _value = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("General",style: TextStyle(fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey),),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.black12,
            child: InkWell(
              onTap: (){},
              child: ListTile(
                onTap: (){},
                title: Text("Alert style ",),
                subtitle: Text("Medium", style: TextStyle(color: Colors.purple) ,),
              ),
            ),
          ),
        ),
        ListTileSwitch(
          value: _value,
          onChanged: (bool value) { setState(() {
            value = true;
          }); },
          switchActiveColor: Colors.indigo,
          title: Text("Show reminder on app screen"),
        ),
        Divider(),
      ],
    );
  }
}
