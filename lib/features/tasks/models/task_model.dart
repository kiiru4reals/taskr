import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final DateTime startDateTime;
  @HiveField(3)
  final DateTime toDateTime;
  @HiveField(5)
  final String priority;
  @HiveField(6)
  final bool isAllDay;
  @HiveField(7)
  bool isComplete;
  Task(
      {required this.title,
      required this.description,
      required this.startDateTime,
      required this.toDateTime,
      required this.priority,
      this.isAllDay = false,
      this.isComplete = false});
}
