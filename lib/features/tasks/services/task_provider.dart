import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:soluprov/features/tasks/models/event_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  UnmodifiableListView<Task> get events => UnmodifiableListView(_tasks);

  // List<Event> get events => _events;
  DateTime _selectedDate  = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  final String taskHiveBox = 'task-box';

  // List<Event> get eventOfSelectedDate => _events;
  // Add events
  Future <void> addTask(Task task) async {
    Box<Task> box = await Hive.openBox<Task>(taskHiveBox);
    await box.add(task);
    _tasks.add(task);
    _tasks = box.values.toList();
    notifyListeners();
  }

  // Retrieve events
  Future<void> getTasks() async {
    Box<Task> box = await Hive.openBox<Task>(taskHiveBox);
    _tasks = box.values.toList();
    notifyListeners();
  }

// Delete events
  Future<void> deleteTask(Task task) async {
    Box<Task> box = await Hive.openBox<Task>(taskHiveBox);
    await box.delete(task.key);
    _tasks = box.values.toList();
    notifyListeners();
  }
}
