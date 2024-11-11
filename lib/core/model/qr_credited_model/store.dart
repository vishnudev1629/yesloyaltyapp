import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
	int? id;
	String? name;
	String? location;
	bool? active;
	String? address;
	String? coordinates;
	@JsonKey(name: 'key_name') 
	String? keyName;
	@JsonKey(name: 'support_name') 
	String? supportName;
	@JsonKey(name: 'email_1') 
	String? email1;
	@JsonKey(name: 'email_2') 
	String? email2;
	@JsonKey(name: 'phone_1') 
	String? phone1;
	@JsonKey(name: 'phone_2') 
	String? phone2;
	@JsonKey(name: 'created_at') 
	DateTime? createdAt;
	@JsonKey(name: 'updated_at') 
	DateTime? updatedAt;
	@JsonKey(name: 'deleted_at') 
	dynamic deletedAt;

	Store({
		this.id, 
		this.name, 
		this.location, 
		this.active, 
		this.address, 
		this.coordinates, 
		this.keyName, 
		this.supportName, 
		this.email1, 
		this.email2, 
		this.phone1, 
		this.phone2, 
		this.createdAt, 
		this.updatedAt, 
		this.deletedAt, 
	});

	factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

	Map<String, dynamic> toJson() => _$StoreToJson(this);
}
