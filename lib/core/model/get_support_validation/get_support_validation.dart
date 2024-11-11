import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_support_validation.g.dart';

@JsonSerializable()
class GetSupportValidation {
	int? status;
	String? message;
	Data? data;
	List<dynamic>? misc;
	dynamic redirect;

	GetSupportValidation({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory GetSupportValidation.fromJson(Map<String, dynamic> json) {
		return _$GetSupportValidationFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GetSupportValidationToJson(this);
}
