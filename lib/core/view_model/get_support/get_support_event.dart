part of 'get_support_bloc.dart';

@freezed
class GetSupportEvent with _$GetSupportEvent {
  const factory GetSupportEvent.started() = _Started;
   const factory GetSupportEvent.getSupport({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) = _GetSupportEvent;
}

