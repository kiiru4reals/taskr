import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:soluprov/features/add_task/widgets/add_tasks_app_bar.dart';
import 'package:soluprov/features/add_task/widgets/description_form_field.dart';
import 'package:soluprov/features/add_task/widgets/from_date_time_picker.dart';
import 'package:soluprov/features/add_task/widgets/title_form_field.dart';
import 'package:soluprov/features/add_task/widgets/to_date_time_picker.dart';
import 'package:soluprov/models/event_model.dart';

class AddTasks extends StatefulWidget {
  final Event? event;

  const AddTasks({Key? key, this.event}) : super(key: key);

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

  // For priority
  List? _priorities;
  int _selectedIndex = 0;

  @override
  void initState() {
    // We fill the values for priority
    _priorities = ["Low", "Medium", "High"];

    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
    }
  }

  void _selectedPriority(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AddTasksAppBar()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TitleFormField(),
                  SizedBox(
                    height: 5,
                  ),
                  DescriptionFormField(),
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
                      FromDateTimePicker(),
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
                      ToDateTimePicker(),
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
                        title: Text("All day event?"),
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
