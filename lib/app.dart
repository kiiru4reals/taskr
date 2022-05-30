import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/core/styles.dart';
import 'package:soluprov/features/add_task/services/configure_date_time_picker.dart';
import 'package:soluprov/features/settings/services/settings_provider.dart';
import 'package:soluprov/features/splashscreen/splash_screen.dart';
import 'package:soluprov/features/tasks/services/task_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ConfigureDateTimePickerProvider>(create: (_) => ConfigureDateTimePickerProvider()),
        Provider<SettingsProvider>(create: (_) => SettingsProvider()),
        Provider<TaskProvider>(create: (_) => TaskProvider()),
      ],
      child: const RootApp(),
    );
  }
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Taskr",
      theme: Styles.theme,
      home: const SplashScreen(),
    );
  }
}
