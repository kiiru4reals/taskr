import 'package:hive/hive.dart';
part 'settings_model.g.dart';

@HiveType(typeId: 1)
class SettingsModel extends HiveObject {
  @HiveField(0)
  final bool presets_time = true;
  @HiveField(1)
  final bool presets_place = false;
  @HiveField(2)
  final String alert_style = "Medium";
  @HiveField(3)
  final bool show_reminder_on_app_screen = false;
  @HiveField(4)
  final bool notifications = true;
}
