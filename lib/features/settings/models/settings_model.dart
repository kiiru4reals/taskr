import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 1)
class SettingsModel extends HiveObject {
  @HiveField(0)
  bool presets_time;
  @HiveField(1)
  bool presets_place;
  @HiveField(2)
  String alert_style;
  @HiveField(3)
  bool show_reminder_on_app_screen;
  @HiveField(4)
  bool notifications;

  SettingsModel(
      {this.presets_time = false,
      this.presets_place = false,
      this.alert_style = "Medium",
      this.show_reminder_on_app_screen = true,
      this.notifications = true});
}
