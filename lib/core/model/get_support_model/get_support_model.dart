import 'package:json_annotation/json_annotation.dart';

part 'get_support_model.g.dart';

@JsonSerializable()
class GetSupportModel {
	int? status;
	String? message;
	List<dynamic>? data;
	List<dynamic>? misc;
	dynamic redirect;

	GetSupportModel({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory GetSupportModel.fromJson(Map<String, dynamic> json) {
		return _$GetSupportModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GetSupportModelToJson(this);
}
