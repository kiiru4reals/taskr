import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/features/settings/domain/settings_repository.dart';

class Presets extends StatefulWidget {
  const Presets({Key? key}) : super(key: key);

  @override
  _PresetsState createState() => _PresetsState();
}

class _PresetsState extends State<Presets> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    provider.getSettings();
    bool presets_time = true;
    bool presets_place = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Presets",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        ListTileSwitch(
          value: presets_time,
          onChanged: (value) {
            setState(() {
              value = presets_time;
            });
          },
          switchActiveColor: Colors.indigo,
          title: Text("Time"),
          visualDensity: VisualDensity.comfortable,
        ),
        ListTileSwitch(
          value: presets_place,
          onChanged: (value) {
            setState(() {
              value = presets_place;
            });
          },
          switchActiveColor: Colors.indigo,
          title: Text("Place"),
        ),
        Divider()
      ],
    );
  }
}
