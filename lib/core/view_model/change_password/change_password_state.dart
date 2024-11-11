part of 'change_password_bloc.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.initial() = _Initial;
  const factory ChangePasswordState.loading() = _Loading;
  const factory ChangePasswordState.success(dynamic response) = _Success;
  const factory ChangePasswordState.failure(String error) = _Failure;
  const factory ChangePasswordState.validationError({
    dynamic currentPasswordError,
    dynamic newPasswordError,
    dynamic confirmPasswordError,
  }) = _ValidationError;
}
