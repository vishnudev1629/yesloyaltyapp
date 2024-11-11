part of 'notification_prefernce_bloc.dart';

@freezed
class NotificationPrefernceEvent with _$NotificationPrefernceEvent {
  const factory NotificationPrefernceEvent.started() = _Started;
  const factory NotificationPrefernceEvent.changeNotificationPrefernce({
    required String offer_notify,
  }) = _ChangeNotificationPrefernce;
}
