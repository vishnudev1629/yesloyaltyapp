import 'package:json_annotation/json_annotation.dart';

import 'cashier.dart';
import 'offer.dart';
import 'offer_eligibility.dart';
import 'store.dart';
import 'transaction.dart';
import 'updated_wallet.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	@JsonKey(name: 'loyalty_status') 
	String? loyaltyStatus;
	Store? store;
	Cashier? cashier;
	Offer? offer;
	Transaction? transaction;
	@JsonKey(name: 'updated_wallet') 
	UpdatedWallet? updatedWallet;
	@JsonKey(name: 'offer_eligibility') 
	OfferEligibility? offerEligibility;

	Data({
		this.loyaltyStatus, 
		this.store, 
		this.cashier, 
		this.offer, 
		this.transaction, 
		this.updatedWallet, 
		this.offerEligibility, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
