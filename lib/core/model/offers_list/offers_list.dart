import 'datum.dart';

class OffersList {
	int? status;
	String? message;
	List<Datum>? data;
	List<dynamic>? misc;
	dynamic redirect;

	OffersList({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory OffersList.fromJson(Map<String, dynamic> json) => OffersList(
				status: json['status'] as int?,
				message: json['message'] as String?,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
				misc: json['misc'] as List<dynamic>?,
				redirect: json['redirect'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'data': data?.map((e) => e.toJson()).toList(),
				'misc': misc,
				'redirect': redirect,
			};
}
