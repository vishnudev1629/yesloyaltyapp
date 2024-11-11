// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDetailsDBAdapter extends TypeAdapter<UserDetailsDB> {
  @override
  final int typeId = 3;

  @override
  UserDetailsDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDetailsDB(
      customer_id: fields[0] as dynamic,
      name: fields[1] as String,
      email: fields[2] as dynamic,
      image: fields[3] as dynamic,
      cacheimage: fields[8] as Uint8List?,
      phone: fields[4] as dynamic,
      wallet_total: fields[7] as dynamic,
      wallet_balance: fields[5] as dynamic,
      wallet_used: fields[6] as dynamic,
      dial_code: fields[9] as String?,
      remember_token: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDetailsDB obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.customer_id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.wallet_balance)
      ..writeByte(6)
      ..write(obj.wallet_used)
      ..writeByte(7)
      ..write(obj.wallet_total)
      ..writeByte(8)
      ..write(obj.cacheimage)
      ..writeByte(9)
      ..write(obj.dial_code)
      ..writeByte(10)
      ..write(obj.remember_token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailsDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
