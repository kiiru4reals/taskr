// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final int typeId = 1;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Settings(
      presets_time: fields[1] as bool,
      presets_place: fields[2] as bool,
      alert_style: fields[3] as String,
      show_reminder_on_app_screen: fields[4] as String,
      notifications: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.presets_time)
      ..writeByte(2)
      ..write(obj.presets_place)
      ..writeByte(3)
      ..write(obj.alert_style)
      ..writeByte(4)
      ..write(obj.show_reminder_on_app_screen)
      ..writeByte(5)
      ..write(obj.notifications);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
