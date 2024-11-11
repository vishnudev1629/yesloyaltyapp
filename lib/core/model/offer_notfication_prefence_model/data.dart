class Data {
	String? offerNotify;

	Data({this.offerNotify});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				offerNotify: json['offer_notify'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'offer_notify': offerNotify,
			};
}
