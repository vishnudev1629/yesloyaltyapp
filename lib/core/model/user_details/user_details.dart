import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails {
	int? status;
	String? message;
	Data? data;
	List<dynamic>? misc;
	dynamic redirect;

	UserDetails({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory UserDetails.fromJson(Map<String, dynamic> json) {
		return _$UserDetailsFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
