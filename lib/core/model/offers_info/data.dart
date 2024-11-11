import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	int? id;
	String? name;
	String? comments;
	@JsonKey(name: 'branch_id') 
	int? branchId;
	@JsonKey(name: 'offer_code') 
	String? offerCode;
	String? slug;
	@JsonKey(name: 'branch_name') 
	String? branchName;
	@JsonKey(name: 'min_inv_amt') 
	String? minInvAmt;
	@JsonKey(name: 'max_inv_amt') 
	String? maxInvAmt;
	int? points;
	String? discount;
	String? type;
	@JsonKey(name: 'usage_limit') 
	int? usageLimit;
	@JsonKey(name: 'expiry_start') 
	String? expiryStart;
	@JsonKey(name: 'expiry_end') 
	String? expiryEnd;
	int? active;

	Data({
		this.id, 
		this.name, 
		this.comments, 
		this.branchId, 
		this.offerCode, 
		this.slug, 
		this.branchName, 
		this.minInvAmt, 
		this.maxInvAmt, 
		this.points, 
		this.discount, 
		this.type, 
		this.usageLimit, 
		this.expiryStart, 
		this.expiryEnd, 
		this.active, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
