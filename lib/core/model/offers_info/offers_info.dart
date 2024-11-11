import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'offers_info.g.dart';

@JsonSerializable()
class OffersInfo {
	int? status;
	String? message;
	Data? data;
	List<dynamic>? misc;
	dynamic redirect;

	OffersInfo({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory OffersInfo.fromJson(Map<String, dynamic> json) {
		return _$OffersInfoFromJson(json);
	}

	Map<String, dynamic> toJson() => _$OffersInfoToJson(this);
}
