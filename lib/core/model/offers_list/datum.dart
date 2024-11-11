class Datum {
	int? id;
	String? name;
	String? comments;
	String? brochure;
	String? brochureUrl;
	int? branchId;
	String? offerCode;
	String? slug;
	String? branchName;
	String? minInvAmt;
	String? maxInvAmt;
	int? points;
	String? discount;
	String? type;
	dynamic usageLimit;
	DateTime? expiryStart;
	dynamic expiryEnd;
	int? active;

	Datum({
		this.id, 
		this.name, 
		this.comments, 
		this.brochure, 
		this.brochureUrl, 
		this.branchId, 
		this.offerCode, 
		this.slug, 
		this.branchName, 
		this.minInvAmt, 
		this.maxInvAmt, 
		this.points, 
		this.discount, 
		this.type, 
		this.usageLimit, 
		this.expiryStart, 
		this.expiryEnd, 
		this.active, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				name: json['name'] as String?,
				comments: json['comments'] as String?,
				brochure: json['brochure'] as String?,
				brochureUrl: json['brochure_url'] as String?,
				branchId: json['branch_id'] as int?,
				offerCode: json['offer_code'] as String?,
				slug: json['slug'] as String?,
				branchName: json['branch_name'] as String?,
				minInvAmt: json['min_inv_amt'] as String?,
				maxInvAmt: json['max_inv_amt'] as String?,
				points: json['points'] as int?,
				discount: json['discount'] as String?,
				type: json['type'] as String?,
				usageLimit: json['usage_limit'] as dynamic,
				expiryStart: json['expiry_start'] == null
						? null
						: DateTime.parse(json['expiry_start'] as String),
				expiryEnd: json['expiry_end'] as dynamic,
				active: json['active'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'comments': comments,
				'brochure': brochure,
				'brochure_url': brochureUrl,
				'branch_id': branchId,
				'offer_code': offerCode,
				'slug': slug,
				'branch_name': branchName,
				'min_inv_amt': minInvAmt,
				'max_inv_amt': maxInvAmt,
				'points': points,
				'discount': discount,
				'type': type,
				'usage_limit': usageLimit,
				'expiry_start': expiryStart?.toIso8601String(),
				'expiry_end': expiryEnd,
				'active': active,
			};
}
