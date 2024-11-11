part of 'reset_password_bloc.dart';

@freezed
class ResetPasswordEvent with _$ResetPasswordEvent {
  const factory ResetPasswordEvent.started() = _Started;
  const factory ResetPasswordEvent.forgotPassword({
    required String password,
    required String password_confirm,
    required String remember_token,
  }) = _ResetPasswordEvent;
}
