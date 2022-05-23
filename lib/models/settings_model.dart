import 'package:hive/hive.dart';
part 'settings_model.g.dart';

@HiveType(typeId: 1)
class Settings extends HiveObject {
  @HiveField(1)
  final bool presets_time;
  @HiveField(2)
  final bool presets_place;
  @HiveField(3)
  final String alert_style;
  @HiveField(4)
  final String show_reminder_on_app_screen;
  @HiveField(5)
  final bool notifications;

  Settings(
      {required this.presets_time,
      required this.presets_place,
      required this.alert_style,
      required this.show_reminder_on_app_screen,
      required this.notifications});
}
