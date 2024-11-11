part of 'reset_password_bloc.dart';

@freezed


class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = _Initial;
  const factory ResetPasswordState.loading() = _Loading;
  const factory ResetPasswordState.success(ResetPasswordModel resetpasswordmodel) = _Success;
  const factory ResetPasswordState.failure(String error) = _Failure;
  const factory ResetPasswordState.validationError({
  dynamic passwordError,
   dynamic passwordConfirmError,
  }) = _ValidationError;
}