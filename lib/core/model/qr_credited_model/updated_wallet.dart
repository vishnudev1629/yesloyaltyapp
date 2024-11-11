import 'package:json_annotation/json_annotation.dart';

part 'updated_wallet.g.dart';

@JsonSerializable()
class UpdatedWallet {
	@JsonKey(name: 'wallet_total') 
	int? walletTotal;
	@JsonKey(name: 'wallet_used') 
	int? walletUsed;
	@JsonKey(name: 'wallet_balance') 
	int? walletBalance;

	UpdatedWallet({this.walletTotal, this.walletUsed, this.walletBalance});

	factory UpdatedWallet.fromJson(Map<String, dynamic> json) {
		return _$UpdatedWalletFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UpdatedWalletToJson(this);
}
