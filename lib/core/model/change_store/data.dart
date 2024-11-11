import 'package:json_annotation/json_annotation.dart';

import 'loyality_offer.dart';
import 'offer_eligibility.dart';
import 'store_offer.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	int? id;
	String? name;
	String? location;
	bool? active;
	String? address;
	String? coordinates;
	@JsonKey(name: 'key_name') 
	String? keyName;
	@JsonKey(name: 'support_name') 
	String? supportName;
	@JsonKey(name: 'email_1') 
	String? email1;
	@JsonKey(name: 'email_2') 
	String? email2;
	@JsonKey(name: 'phone_1') 
	String? phone1;
	@JsonKey(name: 'phone_2') 
	String? phone2;
	@JsonKey(name: 'created_at') 
	DateTime? createdAt;
	@JsonKey(name: 'updated_at') 
	DateTime? updatedAt;
	@JsonKey(name: 'deleted_at') 
	dynamic deletedAt;
	@JsonKey(name: 'loyality_offer') 
	LoyalityOffer? loyalityOffer;
	@JsonKey(name: 'offer_eligibility') 
	OfferEligibility? offerEligibility;
	@JsonKey(name: 'store_offers') 
	List<StoreOffer>? storeOffers;

	Data({
		this.id, 
		this.name, 
		this.location, 
		this.active, 
		this.address, 
		this.coordinates, 
		this.keyName, 
		this.supportName, 
		this.email1, 
		this.email2, 
		this.phone1, 
		this.phone2, 
		this.createdAt, 
		this.updatedAt, 
		this.deletedAt, 
		this.loyalityOffer, 
		this.offerEligibility, 
		this.storeOffers, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
