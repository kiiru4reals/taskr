import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/features/add_task/widgets/description_form_field.dart';
import 'package:soluprov/features/add_task/widgets/from_date_time_picker.dart';
import 'package:soluprov/features/add_task/widgets/title_form_field.dart';
import 'package:soluprov/features/add_task/widgets/to_date_time_picker.dart';
import 'package:soluprov/features/tasks/models/event_model.dart';
import 'package:soluprov/features/tasks/services/task_provider.dart';

class AddTasks extends StatefulWidget {
  final Task? task;

  const AddTasks({Key? key, this.task}) : super(key: key);

  @override
  _AddTasksState createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  late DateTime fromDate;
  late DateTime toDate;
  late bool _isAllDay = false;
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    // We fill the values for priority

    super.initState();

    if (widget.task == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 2));
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          Consumer<TaskProvider>(
              builder: (context, hiveService, widget) => ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      hiveService.deleteTask(Task(
                          title: titleController.text,
                          description: descriptionController.text,
                          startDateTime: fromDate,
                          toDateTime: toDate,
                          priority: "Low"));
                      Navigator.of(context).pop();
                    }
                  },
                  icon: Icon(Icons.done),
                  label: Text("Save")))
        ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TitleFormField(),
                  const SizedBox(
                    height: 5,
                  ),
                  const DescriptionFormField(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "From",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                      const FromDateTimePicker(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "To",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                      const ToDateTimePicker(),
                    ],
                  ),
                  Column(
                    children: [
                      ListTileSwitch(
                        value: _isAllDay,
                        onChanged: (value) {
                          setState(() {
                            _isAllDay = value;
                          });
                        },
                        switchActiveColor: Colors.indigo,
                        title: const Text("All day event?"),
                        visualDensity: VisualDensity.comfortable,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class DateDropDownField extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const DateDropDownField(
      {Key? key, required this.text, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      trailing: const Icon(Icons.arrow_drop_down_outlined),
      onTap: onClicked,
    );
  }
}

class TimeDropDownField extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const TimeDropDownField(
      {Key? key, required this.text, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      trailing: const Icon(Icons.arrow_drop_down_outlined),
      onTap: onClicked,
    );
  }
}
