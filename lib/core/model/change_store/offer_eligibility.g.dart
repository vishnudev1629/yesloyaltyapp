// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_eligibility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferEligibility _$OfferEligibilityFromJson(Map<String, dynamic> json) =>
    OfferEligibility(
      status: json['status'] as bool?,
      pointsRequired: (json['points_required'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OfferEligibilityToJson(OfferEligibility instance) =>
    <String, dynamic>{
      'status': instance.status,
      'points_required': instance.pointsRequired,
    };
