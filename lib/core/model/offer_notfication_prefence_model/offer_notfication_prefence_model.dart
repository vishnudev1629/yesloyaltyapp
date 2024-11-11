import 'data.dart';

class OfferNotficationPrefenceModel {
	int? status;
	String? message;
	Data? data;
	List<dynamic>? misc;

	OfferNotficationPrefenceModel({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
	});

	factory OfferNotficationPrefenceModel.fromJson(Map<String, dynamic> json) {
		return OfferNotficationPrefenceModel(
			status: json['status'] as int?,
			message: json['message'] as String?,
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			misc: json['misc'] as List<dynamic>?,
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'data': data?.toJson(),
				'misc': misc,
			};
}
