// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      location: json['location'] as String?,
      active: json['active'] as bool?,
      address: json['address'] as String?,
      coordinates: json['coordinates'] as String?,
      keyName: json['key_name'] as String?,
      supportName: json['support_name'] as String?,
      email1: json['email_1'] as String?,
      email2: json['email_2'] as String?,
      phone1: json['phone_1'] as String?,
      phone2: json['phone_2'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      loyalityOffer: json['loyality_offer'] == null
          ? null
          : LoyalityOffer.fromJson(
              json['loyality_offer'] as Map<String, dynamic>),
      offerEligibility: json['offer_eligibility'] == null
          ? null
          : OfferEligibility.fromJson(
              json['offer_eligibility'] as Map<String, dynamic>),
      storeOffers: (json['store_offers'] as List<dynamic>?)
          ?.map((e) => StoreOffer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'active': instance.active,
      'address': instance.address,
      'coordinates': instance.coordinates,
      'key_name': instance.keyName,
      'support_name': instance.supportName,
      'email_1': instance.email1,
      'email_2': instance.email2,
      'phone_1': instance.phone1,
      'phone_2': instance.phone2,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'loyality_offer': instance.loyalityOffer,
      'offer_eligibility': instance.offerEligibility,
      'store_offers': instance.storeOffers,
    };
