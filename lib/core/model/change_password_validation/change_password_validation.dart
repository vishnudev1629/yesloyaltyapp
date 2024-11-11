import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'change_password_validation.g.dart';

@JsonSerializable()
class ChangePasswordValidation {
	int? status;
	String? message;
	Data? data;
	List<dynamic>? misc;
	dynamic redirect;

	ChangePasswordValidation({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory ChangePasswordValidation.fromJson(Map<String, dynamic> json) {
		return _$ChangePasswordValidationFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ChangePasswordValidationToJson(this);
}
