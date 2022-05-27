import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:soluprov/features/settings/models/settings_model.dart';

class SettingsProvider extends ChangeNotifier {

  List<SettingsModel> _settings = [];
  UnmodifiableListView<SettingsModel> get settings => UnmodifiableListView(_settings);

  // Define boxes
  final String settingsHiveBox = "settings-box";

/*  // Add default settings to Hive
  Future<void> addInitialSettings (SettingsModel settings) async {
    Box<SettingsModel> box = await Hive.openBox(settingsHiveBox);
  }

  // presets time
  bool _presetstime = true;

  bool get presetsTime => _presetstime;

  set presetsTime(bool value) {
    _presetstime = value;
    Box box = Hive.box(settingsHiveBox);
    Hive.openBox(settingsHiveBox);
    box.put("time", _presetstime);
    notifyListeners();
  }

  // presets place
  bool _presetsPlace = true;

  bool get presetsPlace => _presetsPlace;*/


  Future<void> getSettings() async {
    Box<SettingsModel> box = await Hive.openBox<SettingsModel>(settingsHiveBox);
    _settings = box.values.toList();
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
