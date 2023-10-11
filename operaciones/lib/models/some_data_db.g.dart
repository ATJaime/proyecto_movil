// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'some_data_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SomeDataDbAdapter extends TypeAdapter<SomeDataDb> {
  @override
  final int typeId = 0;

  @override
  SomeDataDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SomeDataDb(
      email: fields[0] as String,
      difficulty: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SomeDataDb obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.difficulty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SomeDataDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
