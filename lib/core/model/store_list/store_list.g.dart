// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreList _$StoreListFromJson(Map<String, dynamic> json) => StoreList(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      misc: json['misc'] as List<dynamic>?,
      redirect: json['redirect'],
    );

Map<String, dynamic> _$StoreListToJson(StoreList instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'misc': instance.misc,
      'redirect': instance.redirect,
    };
