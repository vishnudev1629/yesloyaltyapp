import 'package:json_annotation/json_annotation.dart';

part 'cashier.g.dart';

@JsonSerializable()
class Cashier {
	int? id;
	@JsonKey(name: 'customer_id') 
	int? customerId;
	String? name;
	String? email;
	String? phone;
	dynamic image;
	@JsonKey(name: 'role_id') 
	int? roleId;
	int? branch;
	@JsonKey(name: 'wallet_total') 
	int? walletTotal;
	@JsonKey(name: 'wallet_used') 
	int? walletUsed;
	@JsonKey(name: 'wallet_balance') 
	int? walletBalance;
	@JsonKey(name: 'email_verified_at') 
	dynamic emailVerifiedAt;
	dynamic mode;
	int? active;
	dynamic otp;
	@JsonKey(name: 'otp_expires') 
	dynamic otpExpires;
	@JsonKey(name: 'created_at') 
	DateTime? createdAt;
	@JsonKey(name: 'updated_at') 
	DateTime? updatedAt;
	@JsonKey(name: 'deleted_at') 
	dynamic deletedAt;

	Cashier({
		this.id, 
		this.customerId, 
		this.name, 
		this.email, 
		this.phone, 
		this.image, 
		this.roleId, 
		this.branch, 
		this.walletTotal, 
		this.walletUsed, 
		this.walletBalance, 
		this.emailVerifiedAt, 
		this.mode, 
		this.active, 
		this.otp, 
		this.otpExpires, 
		this.createdAt, 
		this.updatedAt, 
		this.deletedAt, 
	});

	factory Cashier.fromJson(Map<String, dynamic> json) {
		return _$CashierFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CashierToJson(this);
}
