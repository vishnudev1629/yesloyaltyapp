// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      loyaltyStatus: json['loyalty_status'] as String?,
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
      cashier: json['cashier'] == null
          ? null
          : Cashier.fromJson(json['cashier'] as Map<String, dynamic>),
      offer: json['offer'] == null
          ? null
          : Offer.fromJson(json['offer'] as Map<String, dynamic>),
      transaction: json['transaction'] == null
          ? null
          : Transaction.fromJson(json['transaction'] as Map<String, dynamic>),
      updatedWallet: json['updated_wallet'] == null
          ? null
          : UpdatedWallet.fromJson(
              json['updated_wallet'] as Map<String, dynamic>),
      offerEligibility: json['offer_eligibility'] == null
          ? null
          : OfferEligibility.fromJson(
              json['offer_eligibility'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'loyalty_status': instance.loyaltyStatus,
      'store': instance.store,
      'cashier': instance.cashier,
      'offer': instance.offer,
      'transaction': instance.transaction,
      'updated_wallet': instance.updatedWallet,
      'offer_eligibility': instance.offerEligibility,
    };
