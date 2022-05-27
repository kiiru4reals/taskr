import 'package:flutter/material.dart';
import 'package:soluprov/core/date_utils.dart';
import 'package:soluprov/features/add_task/add_task.dart';

class FromDateTimePicker extends StatefulWidget {
  const FromDateTimePicker({Key? key}) : super(key: key);

  @override
  _FromDateTimePickerState createState() => _FromDateTimePickerState();
}

class _FromDateTimePickerState extends State<FromDateTimePicker> {
  late DateTime fromDate;
  late DateTime toDate;
  @override
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
    return                       Row(
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
              onClicked: () => pickFromDateTime(pickDate: false),
            )),
      ],
    );
  }
}
