// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      comments: json['comments'] as String?,
      branchId: (json['branch_id'] as num?)?.toInt(),
      offerCode: json['offer_code'] as String?,
      slug: json['slug'] as String?,
      branchName: json['branch_name'] as String?,
      minInvAmt: json['min_inv_amt'] as String?,
      maxInvAmt: json['max_inv_amt'] as String?,
      points: (json['points'] as num?)?.toInt(),
      discount: json['discount'] as String?,
      type: json['type'] as String?,
      usageLimit: (json['usage_limit'] as num?)?.toInt(),
      expiryStart: json['expiry_start'] as String?,
      expiryEnd: json['expiry_end'] as String?,
      active: (json['active'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'comments': instance.comments,
      'branch_id': instance.branchId,
      'offer_code': instance.offerCode,
      'slug': instance.slug,
      'branch_name': instance.branchName,
      'min_inv_amt': instance.minInvAmt,
      'max_inv_amt': instance.maxInvAmt,
      'points': instance.points,
      'discount': instance.discount,
      'type': instance.type,
      'usage_limit': instance.usageLimit,
      'expiry_start': instance.expiryStart,
      'expiry_end': instance.expiryEnd,
      'active': instance.active,
    };
