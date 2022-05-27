import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/core/config.dart';
import 'package:soluprov/features/splashscreen/splash_screen.dart';
import 'package:soluprov/models/event_model.dart';
import 'package:soluprov/models/settings_model.dart';
import 'package:soluprov/features/events/services/event_provider.dart';
import 'package:soluprov/features/settings/services/settings_provider.dart';


 Future main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(EventAdapter());
  Hive.registerAdapter(SettingsModelAdapter());
  // info = await Hive.openBox('info');
  runApp(const MyApp());
}

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
            EventProvider(),
        ),
      ],
      child: MaterialApp(
        title: Config.appName,
        theme: Config.theme,
        home: SplashScreen(),
      ),
    );
  }
}
