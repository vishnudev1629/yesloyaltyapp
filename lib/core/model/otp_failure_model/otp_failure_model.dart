import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'otp_failure_model.g.dart';

@JsonSerializable()
class OtpFailureModel {
	int? status;
	String? message;
	Data? data;
	List<dynamic>? misc;
	dynamic redirect;

	OtpFailureModel({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory OtpFailureModel.fromJson(Map<String, dynamic> json) {
		return _$OtpFailureModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$OtpFailureModelToJson(this);
}
