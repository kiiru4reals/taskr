import 'package:soluprov/features/tasks/models/event_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource{
  EventDataSource(List<Task>appointments) {
    this.appointments = appointments;
  }
  Task getEvent(int index) => appointments![index] as Task;

  @override
  DateTime getStartTime(int index) => getEvent(index).startDateTime;

  @override
  DateTime getEndTime (int index) => getEvent(index).toDateTime;

  @override
  String getSubject (int index) => getEvent(index).title;

  @override
  bool isAllDay (int index) => getEvent(index).isAllDay;

}