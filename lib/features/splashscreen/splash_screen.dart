import 'dart:async';

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/core/features/BottomNavigationBar/bottom_bar.dart';
import 'package:soluprov/features/settings/services/settings_provider.dart';
import 'package:soluprov/features/tasks/services/event_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double value = 0;

  void downloadData() async{
    new Timer.periodic(
        Duration(seconds: 1),
            (Timer timer){
          setState(() {
            if(value == 1) {
              timer.cancel();
            }
            else {
              value = value + 0.1;
            }
          });
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    final eventsProvider = Provider.of<EventProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    eventsProvider.getEvents();
    return Scaffold(
        body: EasySplashScreen(
          logo: Image.network(
              'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
          title: Text(
            "Taskr- the app",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.grey.shade400,
          showLoader: true,
          loadingText: Text("Setting up"),
          navigator: BottomBarScreen(),
          durationInSeconds: 20,
        ),
    );
  }
}
