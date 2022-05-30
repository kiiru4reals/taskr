import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/core/date_utils.dart';
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

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate,
        pickDate: pickDate, firstDate: pickDate ? fromDate : null);
    if (date == null) return;
    fromDate = date;

    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }
  }

  Future<DateTime?> pickDateTime(DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime(2015, 8),
          lastDate: DateTime(2100));
      if (date == null) return null;

      final time =
      Duration(hours: initialDate.hour, minutes: initialDate.minute);

      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
          context: context, initialTime: TimeOfDay.fromDateTime(initialDate));
      if (timeOfDay == null) return null;
      final date =
      DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }

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
              builder: (context, hiveService, widget) =>
                  ElevatedButton.icon(
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
                  titleFormField(),
                  const SizedBox(
                    height: 5,
                  ),
                  descriptionFormField(),
                  fromDateTimePicker(),
                  toDateTimePicker(),
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
  Widget titleFormField() => TextFormField(
    controller: titleController,
    validator: (title) => title != null && title.isEmpty
        ? "Event must have a name"
        : null,
    decoration: const InputDecoration(
      border: UnderlineInputBorder(),
      hintText: "Laundry",
      label: Text("Task name"),
    ),
  );
  Widget descriptionFormField() => TextFormField(
    controller: descriptionController,
    decoration: const InputDecoration(
      label: Text("Task description"),
      border: UnderlineInputBorder(),
      hintText: "Enter description",
    ),
  );
  Widget fromDateTimePicker() => Column(
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
      Row(
        children: [
          Expanded(
              flex: 2,
              child: DateDropDownField(
                text: DateUtil.toDate(fromDate),
                onClicked: () => pickFromDateTime(pickDate: true),
              )),
          Expanded(
              child: DateDropDownField(
                text: DateUtil.toTime(fromDate),
                onClicked: () => pickFromDateTime(pickDate: false),
              )),
        ],
      ),
    ],
  );
  Widget toDateTimePicker() => Column(
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
      Row(
        children: [
          Expanded(
              flex: 2,
              child: DateDropDownField(
                text: DateUtil.toDate(toDate),
                onClicked: () =>
                    pickFromDateTime(pickDate: true),
              )),
          Expanded(
              child: DateDropDownField(
                text: DateUtil.toTime(toDate),
                onClicked: () => pickFromDateTime(pickDate: false),
              )),
        ],
      ),
    ],
  );
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
