import 'package:hive_flutter/hive_flutter.dart';

part 'notification_adapter.g.dart';

@HiveType(typeId: 5)
class NotificationDB {
  @HiveField(0)
  bool isOfferAvailbleonNextTr;
  @HiveField(1)
  int points_required;
  NotificationDB({
  this.isOfferAvailbleonNextTr = false,
  this.points_required = 0,
  });

  factory NotificationDB.fromJson(Map<String, dynamic> json) {
    return NotificationDB(
      isOfferAvailbleonNextTr: json['isOfferAvailbleonNextTr'] ?? false,
         points_required: json['points_required'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isOfferAvailbleonNextTr'] = isOfferAvailbleonNextTr;
    data['points_required'] = points_required;
    return data;
  }
}
