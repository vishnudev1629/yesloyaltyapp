import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'current_password')
  List<String>? current_password;
  @JsonKey(name: 'new_password')
  List<String>? new_password;
  @JsonKey(name: 'confirm_password')
  List<String>? confirmPassword;

  Data({
    this.confirmPassword,
    this.current_password,
    this.new_password,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
