import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:soluprov/features/settings/models/settings_model.dart';
import 'package:soluprov/features/tasks/models/task_model.dart';

Future initHive() async{
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(SettingsModelAdapter());
}