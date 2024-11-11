import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<String>? email;
  List<String>? name;
  List<String>? phone;
  List<String>? password;
  List<String>? password_confirm;

  Data({
    this.email,
    this.name,
    this.phone,
    this.password,
    this.password_confirm,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
