import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/features/events/services/event_provider.dart';


class AddTasksAppBar extends StatefulWidget {
  const AddTasksAppBar({Key? key}) : super(key: key);

  @override
  _AddTasksAppBarState createState() => _AddTasksAppBarState();
}

class _AddTasksAppBarState extends State<AddTasksAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Consumer<EventProvider>(
            builder: (context, hiveService, widget) =>
                ElevatedButton.icon(
                    onPressed: (){

                    },
                    icon: Icon(Icons.done),
                    label: const Text("Save"))
        )
      ],
    );
  }
}
