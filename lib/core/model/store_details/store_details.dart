import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'store_details.g.dart';

@JsonSerializable()
class StoreDetails {
	int? status;
	String? message;
	Data? data;
	List<dynamic>? misc;
	dynamic redirect;

	StoreDetails({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory StoreDetails.fromJson(Map<String, dynamic> json) {
		return _$StoreDetailsFromJson(json);
	}

	Map<String, dynamic> toJson() => _$StoreDetailsToJson(this);
}
