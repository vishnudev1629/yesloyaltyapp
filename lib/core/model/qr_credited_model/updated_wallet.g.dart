// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updated_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatedWallet _$UpdatedWalletFromJson(Map<String, dynamic> json) =>
    UpdatedWallet(
      walletTotal: (json['wallet_total'] as num?)?.toInt(),
      walletUsed: (json['wallet_used'] as num?)?.toInt(),
      walletBalance: (json['wallet_balance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UpdatedWalletToJson(UpdatedWallet instance) =>
    <String, dynamic>{
      'wallet_total': instance.walletTotal,
      'wallet_used': instance.walletUsed,
      'wallet_balance': instance.walletBalance,
    };
