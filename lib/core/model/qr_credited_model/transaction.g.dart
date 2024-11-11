// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: (json['id'] as num?)?.toInt(),
      transactionType: json['transaction_type'] as String?,
      transactionValue: (json['transaction_value'] as num?)?.toInt(),
      transactionTime: json['transaction_time'] == null
          ? null
          : DateTime.parse(json['transaction_time'] as String),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transaction_type': instance.transactionType,
      'transaction_value': instance.transactionValue,
      'transaction_time': instance.transactionTime?.toIso8601String(),
    };
