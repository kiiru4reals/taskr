import 'package:flutter/material.dart';
import 'package:soluprov/features/add_task/date_utils.dart';
import 'package:soluprov/features/add_task/presentation/pages/widgets/date_dropdown_field.dart';
import 'package:soluprov/features/tasks/models/task_model.dart';

class ToDateTimePicker extends StatefulWidget {
  final Task? task;
  const ToDateTimePicker({Key? key, this.task}) : super(key: key);

  @override
  _ToDateTimePickerState createState() => _ToDateTimePickerState();
}

class _ToDateTimePickerState extends State<ToDateTimePicker> {
  late DateTime fromDate;
  late DateTime toDate;

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
/*  void dispose() {
    titleController.dispose();
    super.dispose();
  }*/

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

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "To",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: DateDropDownField(
                  text: DateUtil.toDate(toDate),
                  onClicked: () => pickFromDateTime(pickDate: true),
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
}
