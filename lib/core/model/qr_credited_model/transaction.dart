import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
	int? id;
	@JsonKey(name: 'transaction_type') 
	String? transactionType;
	@JsonKey(name: 'transaction_value') 
	int? transactionValue;
	@JsonKey(name: 'transaction_time') 
	DateTime? transactionTime;

	Transaction({
		this.id, 
		this.transactionType, 
		this.transactionValue, 
		this.transactionTime, 
	});

	factory Transaction.fromJson(Map<String, dynamic> json) {
		return _$TransactionFromJson(json);
	}

	Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
