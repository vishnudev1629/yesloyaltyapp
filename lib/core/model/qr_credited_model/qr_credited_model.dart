import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'qr_credited_model.g.dart';

@JsonSerializable()
class QrCreditedModel {
	int? status;
	String? message;
	Data? data;
	List<dynamic>? misc;
	dynamic redirect;

	QrCreditedModel({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory QrCreditedModel.fromJson(Map<String, dynamic> json) {
		return _$QrCreditedModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$QrCreditedModelToJson(this);
}
