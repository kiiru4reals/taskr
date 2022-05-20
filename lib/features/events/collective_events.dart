import 'package:flutter/material.dart';
import 'package:soluprov/features/add_task/add_task.dart';
import 'package:soluprov/features/events/widget/calendar_widget.dart';
class CollectiveEvents extends StatefulWidget {
  const CollectiveEvents({Key? key}) : super(key: key);

  @override
  _CollectiveEventsState createState() => _CollectiveEventsState();
}

class _CollectiveEventsState extends State<CollectiveEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your events",),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: CalendarWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddTasks())),
      ),

    );
  }
}
