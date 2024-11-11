// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_credited_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrCreditedModel _$QrCreditedModelFromJson(Map<String, dynamic> json) =>
    QrCreditedModel(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      misc: json['misc'] as List<dynamic>?,
      redirect: json['redirect'],
    );

Map<String, dynamic> _$QrCreditedModelToJson(QrCreditedModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'misc': instance.misc,
      'redirect': instance.redirect,
    };
