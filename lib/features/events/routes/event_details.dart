import 'package:flutter/material.dart';
import 'package:soluprov/models/event_model.dart';

class EventDetailsScreen extends StatefulWidget {
  final Event event;
  const EventDetailsScreen({Key? key, required this.event}) : super(key: key);

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  late final Event eventinfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title of the event", maxLines: 2,
        overflow: TextOverflow.ellipsis,),
        centerTitle: true,
        actions: [

        ],
      ),
      body: Column(
        children: [Text("")],
      )
    );
  }
}
