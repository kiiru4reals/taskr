import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:soluprov/main.dart';
import 'package:soluprov/features/tasks/models/event_model.dart';

class EventDetailsScreen extends StatefulWidget {
  final Event event;
  const EventDetailsScreen({Key? key, required this.event}) : super(key: key);

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    bool value = false;
    return Scaffold(
      appBar: AppBar(
        title: Text("Event title", maxLines: 1,
        overflow: TextOverflow.ellipsis,),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text("Description of the event"),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text("Start time"),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text("End time"),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Material(
              child: ListTileSwitch(value: value, onChanged: (value) {
                setState(() {
                  value = value;
                });
              },
              switchActiveColor: Colors.purple,
                title: Text("Completed"),
                visualDensity: VisualDensity.comfortable,
              ),
            ),
          ),
        ],
      )
    );
  }
}
