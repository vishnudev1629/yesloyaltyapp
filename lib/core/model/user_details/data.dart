import 'package:json_annotation/json_annotation.dart';

import 'loyality_offer.dart';
import 'offer_eligibility.dart';
import 'user.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	User? user;
	@JsonKey(name: 'loyality_offer') 
	LoyalityOffer? loyalityOffer;
	@JsonKey(name: 'offer_eligibility') 
	OfferEligibility? offerEligibility;

	Data({this.user, this.loyalityOffer, this.offerEligibility});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
