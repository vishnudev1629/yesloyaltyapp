import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	int? id;
	@JsonKey(name: 'user_id') 
	int? userId;
	@JsonKey(name: 'store_id') 
	int? storeId;
	@JsonKey(name: 'cashier_id') 
	int? cashierId;
	@JsonKey(name: 'invoice_no') 
	dynamic invoiceNo;
	@JsonKey(name: 'invoice_amt') 
	dynamic invoiceAmt;
	@JsonKey(name: 'offer_id') 
	dynamic offerId;
	int? coins;
	@JsonKey(name: 'coin_type') 
	String? coinType;
	@JsonKey(name: 'final_amt') 
	dynamic finalAmt;
	@JsonKey(name: 'created_at') 
	DateTime? createdAt;
	@JsonKey(name: 'updated_at') 
	dynamic updatedAt;
	@JsonKey(name: 'deleted_at') 
	dynamic deletedAt;
	String? branch;
	@JsonKey(name: 'cashier_name') 
	String? cashierName;
	@JsonKey(name: 'loyality_offer') 
	dynamic loyalityOffer;

	Datum({
		this.id, 
		this.userId, 
		this.storeId, 
		this.cashierId, 
		this.invoiceNo, 
		this.invoiceAmt, 
		this.offerId, 
		this.coins, 
		this.coinType, 
		this.finalAmt, 
		this.createdAt, 
		this.updatedAt, 
		this.deletedAt, 
		this.branch, 
		this.cashierName, 
		this.loyalityOffer, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);
}
