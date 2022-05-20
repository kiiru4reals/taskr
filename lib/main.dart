import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/config.dart';
import 'package:soluprov/features/BottomNavigationBar/bottom_bar.dart';
import 'package:soluprov/features/homepage/home_screen.dart';
import 'package:soluprov/provider/event_provider.dart';

late Box events;
late Box settings;

 Future main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // info = await Hive.openBox('info');
  events = await Hive.openBox('events');
  settings = await Hive.openBox('settings');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => EventProvider(),
    child: MaterialApp(
        title: Config.appName,
        theme: Config.theme,
        home: BottomBarScreen(),
      ),
  );
}
