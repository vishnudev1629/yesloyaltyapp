// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryCodeDBAdapter extends TypeAdapter<CountryCodeDB> {
  @override
  final int typeId = 4;

  @override
  CountryCodeDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryCodeDB(
      country_code: fields[0] as String,
      dial_code: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CountryCodeDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.country_code)
      ..writeByte(1)
      ..write(obj.dial_code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryCodeDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
