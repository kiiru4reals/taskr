import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/features/add_task/presentation/pages/widgets/description_form_field.dart';
import 'package:soluprov/features/add_task/presentation/pages/widgets/from_date_time_picker.dart';
import 'package:soluprov/features/add_task/presentation/pages/widgets/title_form_field.dart';
import 'package:soluprov/features/add_task/presentation/pages/widgets/to_date_time_picker.dart';
import 'package:soluprov/features/tasks/models/task_model.dart';
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
                      hiveService.addTask(Task(
                          title: titleController.text,
                          description: descriptionController.text,
                          startDateTime: fromDate,
                          toDateTime: toDate,
                          priority: "Low"));
                      Navigator.of(context).pop();
                    }
                  },
                  icon: const Icon(Icons.done),
                  label: const Text("Save")))
        ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TitleFormField(),
                  const SizedBox(
                    height: 5,
                  ),
                  DescriptionFormField(),
                  FromDateTimePicker(),
                  ToDateTimePicker(),
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
