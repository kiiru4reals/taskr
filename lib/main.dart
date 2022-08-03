import 'package:flutter/material.dart';
import 'package:soluprov/config/injector.dart';
import 'package:soluprov/core/presentation/app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initHive();
  // info = await Hive.openBox('info');
  runApp(const MyApp());
}
