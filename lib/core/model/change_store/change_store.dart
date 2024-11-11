import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'change_store.g.dart';

@JsonSerializable()
class ChangeStore {
	int? status;
	String? message;
	Data? data;
	List<dynamic>? misc;
	dynamic redirect;

	ChangeStore({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory ChangeStore.fromJson(Map<String, dynamic> json) {
		return _$ChangeStoreFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ChangeStoreToJson(this);
}
