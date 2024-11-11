part of 'notification_prefernce_bloc.dart';

@freezed
class NotificationPrefernceState with _$NotificationPrefernceState {
  const factory NotificationPrefernceState.initial() = _Initial;
  const factory NotificationPrefernceState.loading() = _Loading;
  const factory NotificationPrefernceState.success(
      OfferNotficationPrefenceModel response) = _Success;
  const factory NotificationPrefernceState.failure(String error) = _Failure;
}
