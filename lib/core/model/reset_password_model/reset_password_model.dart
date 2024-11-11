import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'reset_password_model.g.dart';

@JsonSerializable()
class ResetPasswordModel {
	int? status;
	String? message;
	Data? data;
	List<dynamic>? misc;
	dynamic redirect;

	ResetPasswordModel({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
		return _$ResetPasswordModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ResetPasswordModelToJson(this);
}
