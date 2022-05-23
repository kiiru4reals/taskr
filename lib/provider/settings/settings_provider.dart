import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:soluprov/main.dart';

class SettingsProvider extends ChangeNotifier {
  // Define boxes
  final String settingsHiveBox = "settings-box";

  // presets time
  bool _presetstime = true;

  bool get presetsTime => _presetstime;

  set presetsTime(bool value) {
    _presetstime = value;
    Box box = Hive.box(settingsHiveBox);
    box.put("time", _presetstime);
    notifyListeners();
  }

  // presets place
  bool _presetsPlace = true;

  bool get presetsPlace => _presetsPlace;

  set presetsPlace(bool value) {
    _presetsPlace = value;
    Box box = Hive.box(settingsHiveBox);
    box.put("place", _presetsPlace);
    notifyListeners();
  }

  // show reminder on app screen
  bool _showreminderonappScreen = true;

  bool get showreminderonappScreen => _showreminderonappScreen;

  set showreminderonappScreen(bool value) {
    _showreminderonappScreen = value;
    Box box = Hive.box(settingsHiveBox);
    box.put("show_reminder_on_app_screen", _showreminderonappScreen);
    notifyListeners();
  }
}
