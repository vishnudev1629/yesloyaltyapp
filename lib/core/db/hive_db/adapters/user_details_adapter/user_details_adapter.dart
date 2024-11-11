import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
part 'user_details_adapter.g.dart';

@HiveType(typeId: 3)
class UserDetailsDB {
  @HiveField(0)
  dynamic customer_id;
  @HiveField(1)
  String name;
  @HiveField(2)
  dynamic email;
  @HiveField(3)
  dynamic image;

  @HiveField(4)
  dynamic phone;
  @HiveField(5)
  dynamic wallet_balance;
  @HiveField(6)
  dynamic wallet_used;
  @HiveField(7)
  dynamic wallet_total;
  @HiveField(8)
  Uint8List? cacheimage;
  @HiveField(9)
  String? dial_code; // Make dial_code nullable
  @HiveField(10)
  String? remember_token;

  UserDetailsDB({
    this.customer_id,
    this.name = '',
    this.email,
    this.image = '',
    this.cacheimage,
    this.phone,
    this.wallet_total = 0,
    this.wallet_balance = 0,
    this.wallet_used = 0,
    this.dial_code = "+61",
    this.remember_token = "",
  });

  factory UserDetailsDB.fromJson(Map<String, dynamic> json) {
    return UserDetailsDB(
      customer_id: json['customer_id'],
      email: json['email'],
      image: json['image'],
      cacheimage: json['cacheimage'],
      name: json['name'],
      phone: json['phone'],
      wallet_balance: json['wallet_balance'],
      wallet_total: json['wallet_total'],
      wallet_used: json['wallet_used'],
      dial_code: json['dial_code'] ?? "+61",
      remember_token: json['remember_token'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customer_id;
    data['email'] = email;
    data['image'] = image;
    data['cacheimage'] = cacheimage;
    data['name'] = name;
    data['phone'] = phone;
    data['wallet_balance'] = wallet_balance;
    data['wallet_total'] = wallet_total;
    data['wallet_used'] = wallet_used;
    data['dial_code'] = dial_code;
    data['remember_token'] = remember_token;
    return data;
  }
}
