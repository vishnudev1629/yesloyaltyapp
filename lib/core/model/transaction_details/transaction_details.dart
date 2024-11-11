import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'transaction_details.g.dart';

@JsonSerializable()
class TransactionDetails {
	int? status;
	String? message;
	List<Datum>? data;
	List<dynamic>? misc;
	dynamic redirect;

	TransactionDetails({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory TransactionDetails.fromJson(Map<String, dynamic> json) {
		return _$TransactionDetailsFromJson(json);
	}

	Map<String, dynamic> toJson() => _$TransactionDetailsToJson(this);
}
