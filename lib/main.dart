import 'package:flutter/material.dart';
import 'package:soluprov/app.dart';
import 'package:soluprov/config/injector.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initHive();
  // info = await Hive.openBox('info');
  runApp(const MyApp());
}
