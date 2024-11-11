import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'register.g.dart';

@JsonSerializable()
class Register {
	int? status;
	String? message;
	Data? data;
	List<dynamic>? misc;
	dynamic redirect;

	Register({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory Register.fromJson(Map<String, dynamic> json) {
		return _$RegisterFromJson(json);
	}

	Map<String, dynamic> toJson() => _$RegisterToJson(this);
}
