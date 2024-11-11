// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_list_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BranchListDBAdapter extends TypeAdapter<BranchListDB> {
  @override
  final int typeId = 2;

  @override
  BranchListDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BranchListDB(
      id: fields[0] as dynamic,
      selctedBranchName: fields[1] as String,
      locality: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, BranchListDB obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.selctedBranchName)
      ..writeByte(2)
      ..write(obj.locality);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BranchListDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
