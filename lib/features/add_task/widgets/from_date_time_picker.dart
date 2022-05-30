import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/core/date_utils.dart';
import 'package:soluprov/features/add_task/add_task.dart';
import 'package:soluprov/features/add_task/services/configure_date_time_picker.dart';

class FromDateTimePicker extends StatefulWidget {
  const FromDateTimePicker({Key? key}) : super(key: key);

  @override
  _FromDateTimePickerState createState() => _FromDateTimePickerState();
}

class _FromDateTimePickerState extends State<FromDateTimePicker> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ConfigureDateTimePickerProvider>(context);
    return Column(
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
                  text: DateUtil.toDate(provider.fromDate),
                  onClicked: () => provider.pickFromDateTime(pickDate: true),
                )),
            Expanded(
                child: DateDropDownField(
              text: DateUtil.toTime(provider.fromDate),
              onClicked: () => provider.pickFromDateTime(pickDate: false),
            )),
          ],
        ),
      ],
    );
  }
}
