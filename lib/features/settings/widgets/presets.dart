import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/provider/settings/settings_provider.dart';

class Presets extends StatefulWidget {
  const Presets({Key? key}) : super(key: key);

  @override
  _PresetsState createState() => _PresetsState();
}

class _PresetsState extends State<Presets> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    provider.presetsTime;
    provider.presetsPlace;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Presets", style: TextStyle(fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey),),
        ),
        ListTileSwitch(
          value: provider.presetsTime,
          onChanged: (value) { setState(() {
            provider.presetsTime = value;
        }); },
          switchActiveColor: Colors.indigo,
          title: Text("Time"),
          visualDensity: VisualDensity.comfortable,
        ),
        ListTileSwitch(
          value: provider.presetsPlace,
          onChanged: (value) { setState(() {
            provider.presetsPlace = value;
          }); },
          switchActiveColor: Colors.indigo,
          title: Text("Place"),
        ),
        Divider()
      ],
    );
  }
}
