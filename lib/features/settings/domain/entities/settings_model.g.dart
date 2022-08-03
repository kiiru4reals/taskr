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
      presetsTime: fields[0] as bool,
      presetsPlace: fields[1] as bool,
      alertStyle: fields[2] as String,
      showReminderOnAppScreen: fields[3] as bool,
      notifications: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.presetsTime)
      ..writeByte(1)
      ..write(obj.presetsPlace)
      ..writeByte(2)
      ..write(obj.alertStyle)
      ..writeByte(3)
      ..write(obj.showReminderOnAppScreen)
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
