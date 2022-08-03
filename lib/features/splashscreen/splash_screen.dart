import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/core/presentation/BottomNavigationBar/bottom_bar.dart';
import 'package:soluprov/features/settings/services/settings_provider.dart';
import 'package:soluprov/features/tasks/services/task_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    final eventsProvider = Provider.of<TaskProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    eventsProvider.getTasks();
    settingsProvider.getSettings();
    return Scaffold(
      body: EasySplashScreen(
        logo: Image.network(
            'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
        title: const Text(
          "Taskr- the app",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey.shade400,
        showLoader: true,
        loadingText: const Text("Setting up"),
        navigator: const BottomBarScreen(),
        durationInSeconds: 20,
      ),
    );
  }
}
