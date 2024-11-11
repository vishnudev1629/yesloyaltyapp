// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      confirmPassword: (json['confirm_password'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      current_password: (json['current_password'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      new_password: (json['new_password'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'current_password': instance.current_password,
      'new_password': instance.new_password,
      'confirm_password': instance.confirmPassword,
    };
