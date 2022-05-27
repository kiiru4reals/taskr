import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/features/tasks/services/task_provider.dart';
import 'package:soluprov/features/tasks/widget/day_agenda.dart';
import 'package:soluprov/core/utils/event_data_source.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<TaskProvider>(context).events;
    return SfCalendar(
      dataSource: EventDataSource(events),
      view: CalendarView.month,
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      onLongPress: (details){
        final provider = Provider.of<TaskProvider>(context, listen: false);
        provider.setDate(details.date!);
        showModalBottomSheet(context: context, builder: (context) => DayAgenda());
      },




    );
  }
}
