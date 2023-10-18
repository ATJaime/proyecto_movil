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
      name: fields[0] as String,
      grade: fields[1] as String,
      school: fields[2] as String,
      difficulty: (fields[3] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, SomeDataDb obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.grade)
      ..writeByte(2)
      ..write(obj.school)
      ..writeByte(3)
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
