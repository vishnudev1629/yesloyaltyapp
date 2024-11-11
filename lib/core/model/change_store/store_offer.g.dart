// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreOffer _$StoreOfferFromJson(Map<String, dynamic> json) => StoreOffer(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      comments: json['comments'] as String?,
      branchId: (json['branch_id'] as num?)?.toInt(),
      offerCode: json['offer_code'] as String?,
      slug: json['slug'] as String?,
      offerRule: json['offer_rule'],
      offerTc: json['offer_tc'],
      minInvAmt: json['min_inv_amt'] as String?,
      maxInvAmt: json['max_inv_amt'] as String?,
      points: (json['points'] as num?)?.toInt(),
      discount: json['discount'] as String?,
      type: json['type'] as String?,
      usageLimit: json['usage_limit'],
      expiryStart: json['expiry_start'] == null
          ? null
          : DateTime.parse(json['expiry_start'] as String),
      expiryEnd: json['expiry_end'],
      active: (json['active'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$StoreOfferToJson(StoreOffer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'comments': instance.comments,
      'branch_id': instance.branchId,
      'offer_code': instance.offerCode,
      'slug': instance.slug,
      'offer_rule': instance.offerRule,
      'offer_tc': instance.offerTc,
      'min_inv_amt': instance.minInvAmt,
      'max_inv_amt': instance.maxInvAmt,
      'points': instance.points,
      'discount': instance.discount,
      'type': instance.type,
      'usage_limit': instance.usageLimit,
      'expiry_start': instance.expiryStart?.toIso8601String(),
      'expiry_end': instance.expiryEnd,
      'active': instance.active,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
    };
