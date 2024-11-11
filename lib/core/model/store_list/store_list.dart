import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'store_list.g.dart';

@JsonSerializable()
class StoreList {
	int? status;
	String? message;
	List<Datum>? data;
	List<dynamic>? misc;
	dynamic redirect;

	StoreList({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory StoreList.fromJson(Map<String, dynamic> json) {
		return _$StoreListFromJson(json);
	}

	Map<String, dynamic> toJson() => _$StoreListToJson(this);
}
