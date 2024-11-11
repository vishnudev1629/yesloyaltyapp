// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      loyalityOffer: json['loyality_offer'] == null
          ? null
          : LoyalityOffer.fromJson(
              json['loyality_offer'] as Map<String, dynamic>),
      offerEligibility: json['offer_eligibility'] == null
          ? null
          : OfferEligibility.fromJson(
              json['offer_eligibility'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user': instance.user,
      'loyality_offer': instance.loyalityOffer,
      'offer_eligibility': instance.offerEligibility,
    };
