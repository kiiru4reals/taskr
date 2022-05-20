import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class Presets extends StatefulWidget {
  const Presets({Key? key}) : super(key: key);

  @override
  _PresetsState createState() => _PresetsState();
}

class _PresetsState extends State<Presets> {
  @override
  Widget build(BuildContext context) {
    bool _value = true;
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
          value: _value,
          onChanged: (bool value) { setState(() {
          value = true;
        }); },
          switchActiveColor: Colors.indigo,
          title: Text("Time"),
          visualDensity: VisualDensity.comfortable,
        ),
        ListTileSwitch(
          value: _value,
          onChanged: (bool value) { setState(() {
            value = true;
          }); },
          switchActiveColor: Colors.indigo,
          title: Text("Place"),
        ),
        Divider()
      ],
    );
  }
}
