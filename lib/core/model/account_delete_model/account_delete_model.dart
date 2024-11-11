import 'package:json_annotation/json_annotation.dart';

part 'account_delete_model.g.dart';

@JsonSerializable()
class AccountDeleteModel {
	int? status;
	String? message;
	List<dynamic>? data;
	List<dynamic>? misc;
	dynamic redirect;

	AccountDeleteModel({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory AccountDeleteModel.fromJson(Map<String, dynamic> json) {
		return _$AccountDeleteModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AccountDeleteModelToJson(this);
}
