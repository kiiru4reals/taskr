import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/app.dart';
import 'package:soluprov/core/styles.dart';
import 'package:soluprov/features/splashscreen/splash_screen.dart';
import 'package:soluprov/features/tasks/services/task_provider.dart';
import 'package:soluprov/features/tasks/models/task_model.dart';
import 'package:soluprov/features/settings/models/settings_model.dart';
import 'package:soluprov/features/settings/services/settings_provider.dart';
import 'package:soluprov/init.dart';


 Future main() async{
   WidgetsFlutterBinding.ensureInitialized();
   initHive();
  // info = await Hive.openBox('info');
  runApp(const MyApp());
}

