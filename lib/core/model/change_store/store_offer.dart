import 'package:json_annotation/json_annotation.dart';

part 'store_offer.g.dart';

@JsonSerializable()
class StoreOffer {
	int? id;
	String? name;
	String? comments;
	@JsonKey(name: 'branch_id') 
	int? branchId;
	@JsonKey(name: 'offer_code') 
	String? offerCode;
	String? slug;
	@JsonKey(name: 'offer_rule') 
	dynamic offerRule;
	@JsonKey(name: 'offer_tc') 
	dynamic offerTc;
	@JsonKey(name: 'min_inv_amt') 
	String? minInvAmt;
	@JsonKey(name: 'max_inv_amt') 
	String? maxInvAmt;
	int? points;
	String? discount;
	String? type;
	@JsonKey(name: 'usage_limit') 
	dynamic usageLimit;
	@JsonKey(name: 'expiry_start') 
	DateTime? expiryStart;
	@JsonKey(name: 'expiry_end') 
	dynamic expiryEnd;
	int? active;
	@JsonKey(name: 'created_at') 
	DateTime? createdAt;
	@JsonKey(name: 'updated_at') 
	DateTime? updatedAt;
	@JsonKey(name: 'deleted_at') 
	dynamic deletedAt;

	StoreOffer({
		this.id, 
		this.name, 
		this.comments, 
		this.branchId, 
		this.offerCode, 
		this.slug, 
		this.offerRule, 
		this.offerTc, 
		this.minInvAmt, 
		this.maxInvAmt, 
		this.points, 
		this.discount, 
		this.type, 
		this.usageLimit, 
		this.expiryStart, 
		this.expiryEnd, 
		this.active, 
		this.createdAt, 
		this.updatedAt, 
		this.deletedAt, 
	});

	factory StoreOffer.fromJson(Map<String, dynamic> json) {
		return _$StoreOfferFromJson(json);
	}

	Map<String, dynamic> toJson() => _$StoreOfferToJson(this);
}
