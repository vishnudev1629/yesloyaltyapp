import 'package:json_annotation/json_annotation.dart';

part 'loyality_offer.g.dart';

@JsonSerializable()
class LoyalityOffer {
	int? id;
	String? name;
	String? comments;
	@JsonKey(name: 'branch_id') 
	int? branchId;
	@JsonKey(name: 'offer_code') 
	String? offerCode;
	String? slug;
	@JsonKey(name: 'min_inv_amt') 
	int? minInvAmt;
	@JsonKey(name: 'max_reduction') 
	int? maxReduction;
	@JsonKey(name: 'points_required') 
	int? pointsRequired;
	@JsonKey(name: 'discount_val') 
	int? discountVal;
	@JsonKey(name: 'discount_type') 
	String? discountType;
	@JsonKey(name: 'usage_limit') 
	int? usageLimit;
	@JsonKey(name: 'expiry_start') 
	DateTime? expiryStart;
	@JsonKey(name: 'expiry_end') 
	DateTime? expiryEnd;
	bool? active;
	@JsonKey(name: 'created_at') 
	DateTime? createdAt;
	@JsonKey(name: 'updated_at') 
	DateTime? updatedAt;
	@JsonKey(name: 'deleted_at') 
	dynamic deletedAt;

	LoyalityOffer({
		this.id, 
		this.name, 
		this.comments, 
		this.branchId, 
		this.offerCode, 
		this.slug, 
		this.minInvAmt, 
		this.maxReduction, 
		this.pointsRequired, 
		this.discountVal, 
		this.discountType, 
		this.usageLimit, 
		this.expiryStart, 
		this.expiryEnd, 
		this.active, 
		this.createdAt, 
		this.updatedAt, 
		this.deletedAt, 
	});

	factory LoyalityOffer.fromJson(Map<String, dynamic> json) {
		return _$LoyalityOfferFromJson(json);
	}

	Map<String, dynamic> toJson() => _$LoyalityOfferToJson(this);
}
