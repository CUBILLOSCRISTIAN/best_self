// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitDbAdapter extends TypeAdapter<HabitDb> {
  @override
  final int typeId = 0;

  @override
  HabitDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitDb(
      id: fields[0] as String,
      title: fields[1] as String,
      icon: fields[2] as String,
      numeroDeVeces: fields[3] as int,
      isCompleted: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HabitDb obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.numeroDeVeces)
      ..writeByte(4)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
