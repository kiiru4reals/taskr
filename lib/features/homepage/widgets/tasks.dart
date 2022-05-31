import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/features/tasks/services/task_provider.dart';
import 'package:soluprov/features/tasks/models/task_model.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    final eventsProvider = Provider.of<TaskProvider>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Tasks", style: Theme.of(context).textTheme.titleMedium),
      ),
      eventsProvider.events.isEmpty
          ? const Center(
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
                Task task = eventsProvider.events[index];
                return Slidable(
                  key: const ValueKey(0),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete_forever,
                        label: 'Delete',
                        onPressed: (BuildContext context) => eventsProvider.deleteTask(task),
                      ),
                      SlidableAction(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        icon: Icons.task_alt,
                        label: 'Completed',
                        onPressed: (BuildContext context) => setState(() {
                          task.isComplete = true;
                          eventsProvider.markAsComplete(task);
                        }),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.black12,
                      child: ListTile(
                        onTap:
                            () {} /*=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventDetailsScreen(event: event,)))*/,
                        title: Text(
                          task.title,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          task.isComplete == false ? "Incomplete": "Complete",
                          style:
                              const TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                );
              }),
    ]);
  }
}
