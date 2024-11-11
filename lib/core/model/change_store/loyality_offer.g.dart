// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyality_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoyalityOffer _$LoyalityOfferFromJson(Map<String, dynamic> json) =>
    LoyalityOffer(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      comments: json['comments'] as String?,
      branchId: (json['branch_id'] as num?)?.toInt(),
      offerCode: json['offer_code'] as String?,
      slug: json['slug'] as String?,
      minInvAmt: (json['min_inv_amt'] as num?)?.toInt(),
      maxReduction: (json['max_reduction'] as num?)?.toInt(),
      pointsRequired: (json['points_required'] as num?)?.toInt(),
      discountVal: (json['discount_val'] as num?)?.toInt(),
      discountType: json['discount_type'] as String?,
      usageLimit: (json['usage_limit'] as num?)?.toInt(),
      expiryStart: json['expiry_start'] == null
          ? null
          : DateTime.parse(json['expiry_start'] as String),
      expiryEnd: json['expiry_end'] == null
          ? null
          : DateTime.parse(json['expiry_end'] as String),
      active: json['active'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$LoyalityOfferToJson(LoyalityOffer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'comments': instance.comments,
      'branch_id': instance.branchId,
      'offer_code': instance.offerCode,
      'slug': instance.slug,
      'min_inv_amt': instance.minInvAmt,
      'max_reduction': instance.maxReduction,
      'points_required': instance.pointsRequired,
      'discount_val': instance.discountVal,
      'discount_type': instance.discountType,
      'usage_limit': instance.usageLimit,
      'expiry_start': instance.expiryStart?.toIso8601String(),
      'expiry_end': instance.expiryEnd?.toIso8601String(),
      'active': instance.active,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
    };
