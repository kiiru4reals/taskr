// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsModelAdapter extends TypeAdapter<SettingsModel> {
  @override
  final int typeId = 1;

  @override
  SettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsModel(
      presets_time: fields[0] as bool,
      presets_place: fields[1] as bool,
      alert_style: fields[2] as String,
      show_reminder_on_app_screen: fields[3] as bool,
      notifications: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.presets_time)
      ..writeByte(1)
      ..write(obj.presets_place)
      ..writeByte(2)
      ..write(obj.alert_style)
      ..writeByte(3)
      ..write(obj.show_reminder_on_app_screen)
      ..writeByte(4)
      ..write(obj.notifications);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
