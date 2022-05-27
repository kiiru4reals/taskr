import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/core/styles.dart';
import 'package:soluprov/models/event_model.dart';
import 'package:soluprov/features/events/services/event_provider.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    final eventsProvider = Provider.of<EventProvider>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Tasks", style: Theme.of(context).textTheme.titleMedium),
      ),
      eventsProvider.events.length == 0
          ? Center(
              child: Text(
                "No tasks at the moment",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            )
          : ListView.builder(
              itemCount: eventsProvider.events.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                Event event = eventsProvider.events[index];
                return Dismissible(
                  key: ObjectKey(event),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) => eventsProvider.deleteEvents(event),
                  background: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.red,
                    child: Icon(Icons.delete_forever, color: Colors.white, size: 20,),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.black12,
                      child: ListTile(
                        onTap:
                            () {} /*=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventDetailsScreen(event: event,)))*/,
                        title: Text(
                          event.title,
                        style: TextStyle(
                          fontSize: 18,
                        ),),
                        subtitle: Text(
                          "",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ),
                );
              }),
    ]);
  }
}
