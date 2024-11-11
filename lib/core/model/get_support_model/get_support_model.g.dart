// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_support_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSupportModel _$GetSupportModelFromJson(Map<String, dynamic> json) =>
    GetSupportModel(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
      misc: json['misc'] as List<dynamic>?,
      redirect: json['redirect'],
    );

Map<String, dynamic> _$GetSupportModelToJson(GetSupportModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'misc': instance.misc,
      'redirect': instance.redirect,
    };
