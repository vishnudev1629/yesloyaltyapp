import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'login_validation.g.dart';

@JsonSerializable()
class LoginValidation {
	int? status;
	String? message;
	Data? data;
	List<dynamic>? misc;
	dynamic redirect;

	LoginValidation({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory LoginValidation.fromJson(Map<String, dynamic> json) {
		return _$LoginValidationFromJson(json);
	}

	Map<String, dynamic> toJson() => _$LoginValidationToJson(this);
}
