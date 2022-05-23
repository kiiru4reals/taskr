import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class SharedReminders extends StatefulWidget {
  const SharedReminders({Key? key}) : super(key: key);

  @override
  _SharedRemindersState createState() => _SharedRemindersState();
}

class _SharedRemindersState extends State<SharedReminders> {
  @override
  Widget build(BuildContext context) {
    bool _value = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Shared Reminders",style: TextStyle(fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey),),
        ),
        ListTileSwitch(
          value: _value,
          onLongPress: (){
            final snackBar = SnackBar(content: Text("Feature coming soon. Stay tuned :)"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          onChanged: (bool value){},
          switchActiveColor: Colors.indigo,
          title: Text("Notifications"),
          subtitle: Text("Get notified when someone else add of completes a reminder"),
        ),
        Divider(),
      ],
    );
  }
}
