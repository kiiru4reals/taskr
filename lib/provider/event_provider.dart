import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:soluprov/models/event_model.dart';

class EventProvider extends ChangeNotifier {
  List<Event> _events = [];
  UnmodifiableListView<Event> get events => UnmodifiableListView(_events);

  // List<Event> get events => _events;
  DateTime _selectedDate  = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  final String eventHiveBox = 'event-box';

  // List<Event> get eventOfSelectedDate => _events;
  // Add events
  Future <void> addEvent(Event event) async{
    Box<Event> box = await Hive.openBox<Event>(eventHiveBox);
    await box.add(event);
    _events.add(event);
    _events = box.values.toList();
    notifyListeners();
  }

  // Retrieve events
Future <void> getEvents() async{
    Box<Event> box = await Hive.openBox<Event>(eventHiveBox);
    _events = box.values.toList();
    notifyListeners();
}

// Delete events

Future <void> deleteEvents(Event event) async{
    Box<Event> box = await Hive.openBox<Event>(eventHiveBox);
    await box.delete(event.key);
    _events = box.values.toList();
    notifyListeners();
}

}