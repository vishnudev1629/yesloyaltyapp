// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationDBAdapter extends TypeAdapter<NotificationDB> {
  @override
  final int typeId = 5;

  @override
  NotificationDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationDB(
      isOfferAvailbleonNextTr: fields[0] as bool,
      points_required: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isOfferAvailbleonNextTr)
      ..writeByte(1)
      ..write(obj.points_required);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
