import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'validation_response.g.dart';

@JsonSerializable()
class ValidationResponse {
	int? status;
	String? message;
	Data? data;
	List<dynamic>? misc;
	dynamic redirect;

	ValidationResponse({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory ValidationResponse.fromJson(Map<String, dynamic> json) {
		return _$ValidationResponseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ValidationResponseToJson(this);
}
