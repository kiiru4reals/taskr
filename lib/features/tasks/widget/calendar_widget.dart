import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/features/tasks/services/event_provider.dart';
import 'package:soluprov/features/tasks/widget/day_agenda.dart';
import 'package:soluprov/models/event_data_source.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return SfCalendar(
      dataSource: EventDataSource(events),
      view: CalendarView.month,
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      onLongPress: (details){
        final provider = Provider.of<EventProvider>(context, listen: false);
        provider.setDate(details.date!);
        showModalBottomSheet(context: context, builder: (context) => DayAgenda());
      },




    );
  }
}
