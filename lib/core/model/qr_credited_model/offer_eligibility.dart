import 'package:json_annotation/json_annotation.dart';

part 'offer_eligibility.g.dart';

@JsonSerializable()
class OfferEligibility {
	bool? status;
	@JsonKey(name: 'points_required') 
	int? pointsRequired;

	OfferEligibility({this.status, this.pointsRequired});

	factory OfferEligibility.fromJson(Map<String, dynamic> json) {
		return _$OfferEligibilityFromJson(json);
	}

	Map<String, dynamic> toJson() => _$OfferEligibilityToJson(this);
}
