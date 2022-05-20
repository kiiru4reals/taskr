import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part "event.g.dart";

@HiveType(typeId: 0)
class Event extends HiveObject{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final DateTime startDateTime;
  @HiveField(3)
  final DateTime toDateTime;
  @HiveField(4)
  final Color backgroundColor;
  @HiveField(5)
  final String priority;
  @HiveField(6)
  final bool isAllDay;

  Event({required this.title, required this.description, required this.startDateTime, required this.toDateTime, this.backgroundColor = Colors.green, required this.priority, this.isAllDay = false});
}