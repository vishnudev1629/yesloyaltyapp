part of 'forgot_password_bloc.dart';

@freezed

class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.loading() = _Loading;
  const factory ForgotPasswordState.success(ResetPasswordModel resetpasswordmodel) = _Success;
  const factory ForgotPasswordState.failure(String error) = _Failure;
  const factory ForgotPasswordState.validationError({
  required  String message,
  }) = _ValidationError;
}
