import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:soluprov/features/tasks/models/event_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Event> _tasks = [];
  UnmodifiableListView<Event> get events => UnmodifiableListView(_tasks);

  // List<Event> get events => _events;
  DateTime _selectedDate  = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  final String taskHiveBox = 'task-box';

  // List<Event> get eventOfSelectedDate => _events;
  // Add events
  Future <void> addTask(Event event) async {
    Box<Event> box = await Hive.openBox<Event>(taskHiveBox);
    await box.add(event);
    _tasks.add(event);
    _tasks = box.values.toList();
    notifyListeners();
  }

  // Retrieve events
  Future<void> getTasks() async {
    Box<Event> box = await Hive.openBox<Event>(taskHiveBox);
    _tasks = box.values.toList();
    notifyListeners();
  }

// Delete events
  Future<void> deleteTask(Event event) async {
    Box<Event> box = await Hive.openBox<Event>(taskHiveBox);
    await box.delete(event.key);
    _tasks = box.values.toList();
    notifyListeners();
  }
}
