import 'package:flutter/material.dart';
import 'package:soluprov/core/styles.dart';
import 'package:soluprov/features/splashscreen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>
            SettingsProvider(),
        ),
        ChangeNotifierProvider(create: (_) =>
            TaskProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Taskr",
        theme: Styles.theme,
        home: SplashScreen(),
      ),
    );
  }
}