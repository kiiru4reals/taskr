import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/config.dart';
import 'package:soluprov/core/date_utils.dart';
import 'package:soluprov/models/event_model.dart';
import 'package:soluprov/provider/event_provider.dart';

class AddTasks extends StatefulWidget {
  final Event? event;

  const AddTasks({Key? key, this.event}) : super(key: key);

  @override
  _AddTasksState createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  late DateTime fromDate;
  late DateTime toDate;
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate,
        pickDate: pickDate, firstDate: pickDate ? fromDate : null);
    if (date == null) return;
    setState(() => fromDate = date);

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

  Future _saveForm() async {
    final _isvalid = _formKey.currentState!.validate();

    if(_isvalid) {
      final event = Event(
        title: titleController.text,
        startDateTime: fromDate,
        toDateTime: toDate,
        description: descriptionController.text,
        isAllDay: false,
        priority: "Low",
      );

      final provider = Provider.of<EventProvider>(context, listen: false);
      provider.addEvent(event);
      
      Navigator.of(context).pop();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton.icon(
                onPressed: _saveForm, icon: Icon(Icons.done), label: Text("Save"))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  TextFormField(
                    onFieldSubmitted: (_) => _saveForm(),
                  controller: titleController,
                  validator: (title) =>
                  title != null && title.isEmpty
                      ? "Event must have a name"
                      : null,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Laundry",
                    label: Text("Task name"),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    label: Text("Task description"),
                    border: UnderlineInputBorder(),
                    hintText: "Wash my clothes",
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                              onClicked: () =>
                                  pickFromDateTime(pickDate: true),
                            )),
                        Expanded(
                            child: DateDropDownField(
                              text: DateUtil.toTime(fromDate),
                              onClicked: () =>
                                  pickFromDateTime(pickDate: false),
                            )),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                              onClicked: () =>
                                  pickFromDateTime(pickDate: false),
                            )),
                      ],
                    ),
                  ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Priority",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                    width: MediaQuery.of(context).size.width*.3,
                    child: OutlinedButton(onPressed: ()
              {},
              child: Text("Low"),
              style: OutlinedButton.styleFrom(

                side: BorderSide(
                    color: Colors.green,
                ),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              )
          ),
                  ),
                Container(
                  width: MediaQuery.of(context).size.width*.3,
                  child: OutlinedButton(onPressed: ()
                  {},
                      child: Text("Medium"),
                      style: OutlinedButton.styleFrom(

                        side: BorderSide(
                          color: Colors.orangeAccent,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      )
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.3,
                  child: OutlinedButton(onPressed: ()
                  {},
                      child: Text("High"),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.red,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      )
                  ),
                ),
        ]),
    ],
    ),
    ],
    ),
    ),
    )
    ,
    )
    );
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
      trailing: Icon(Icons.arrow_drop_down_outlined),
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
      trailing: Icon(Icons.arrow_drop_down_outlined),
      onTap: onClicked,
    );
  }
}
