part of 'get_support_bloc.dart';

@freezed
class GetSupportState with _$GetSupportState {
  const factory GetSupportState.initial() = _Initial;
  const factory GetSupportState.loading() = _Loading;
  const factory GetSupportState.success(GetSupportModel getSupport) = _Success;
  const factory GetSupportState.failure(String error) = _Failure;
  const factory GetSupportState.validationError({
  required  String message,
  }) = _ValidationError;
}
