import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
part 'country_code_adapter.g.dart';

@HiveType(typeId: 4)
class CountryCodeDB {
  @HiveField(0)
  String country_code;
  @HiveField(1)
  String dial_code;

  CountryCodeDB({
    this.country_code = 'AU',
    this.dial_code = '61',
  });

  factory CountryCodeDB.fromJson(Map<String, dynamic> json) {
    return CountryCodeDB(
      country_code: json['country_code'],
      dial_code: json['dial_code'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country_code'] = country_code;
    data['dial_code'] = dial_code;
    return data;
  }
}