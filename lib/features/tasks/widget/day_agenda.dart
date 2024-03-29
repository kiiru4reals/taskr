import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/features/tasks/data/event_local_data_source.dart';
import 'package:soluprov/features/tasks/services/task_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class DayAgenda extends StatefulWidget {
  const DayAgenda({Key? key}) : super(key: key);

  @override
  _DayAgendaState createState() => _DayAgendaState();
}

class _DayAgendaState extends State<DayAgenda> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    final selectedEvents = provider.taskHiveBox;

    if (selectedEvents.isEmpty) {
      return const Center(
        child: Text(
          "Your day is as formless just like your face",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }
    return SfCalendarTheme(
      data: SfCalendarThemeData(
          timeTextStyle: const TextStyle(fontSize: 14, color: Colors.black)),
      child: SfCalendar(
        view: CalendarView.timelineDay,
        dataSource: EventLocalDataSource(provider.events),
        initialDisplayDate: provider.selectedDate,
        appointmentBuilder: appointmentBuilder,
        headerHeight: 0,
        todayHighlightColor: Colors.black,
        selectionDecoration: BoxDecoration(
          color: Colors.purpleAccent.withOpacity(.3),
        ),
        /*onTap: (details){
          if (details.appointments == null) return;
          final event = details.appointments!.first;

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventDetailsScreen(event: event),
          ));
        },*/
      ),
    );
  }

  Widget appointmentBuilder(
      BuildContext context, CalendarAppointmentDetails details) {
    final event = details.appointments.first;
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(.5),
        borderRadius: BorderRadius.circular(12.0),
      ),
      width: details.bounds.width,
      height: details.bounds.height,
      child: Center(
        child: Text(
          event.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
