import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'update_password_model.g.dart';

@JsonSerializable()
class UpdatePasswordModel {
	int? status;
	String? message;
	Data? data;
	List<dynamic>? misc;
	dynamic redirect;

	UpdatePasswordModel({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory UpdatePasswordModel.fromJson(Map<String, dynamic> json) {
		return _$UpdatePasswordModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UpdatePasswordModelToJson(this);
}
