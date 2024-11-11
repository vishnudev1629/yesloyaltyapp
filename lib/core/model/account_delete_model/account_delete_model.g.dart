// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_delete_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDeleteModel _$AccountDeleteModelFromJson(Map<String, dynamic> json) =>
    AccountDeleteModel(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
      misc: json['misc'] as List<dynamic>?,
      redirect: json['redirect'],
    );

Map<String, dynamic> _$AccountDeleteModelToJson(AccountDeleteModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'misc': instance.misc,
      'redirect': instance.redirect,
    };
