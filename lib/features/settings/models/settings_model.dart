import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 1)
class SettingsModel extends HiveObject {
  @HiveField(0)
  bool presetsTime;
  @HiveField(1)
  bool presetsPlace;
  @HiveField(2)
  String alertStyle;
  @HiveField(3)
  bool showReminderOnAppScreen;
  @HiveField(4)
  bool notifications;

  SettingsModel(
      {this.presetsTime = false,
      this.presetsPlace = false,
      this.alertStyle = "Medium",
      this.showReminderOnAppScreen = true,
      this.notifications = true});
}
