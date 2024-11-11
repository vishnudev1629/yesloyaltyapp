part of 'change_password_bloc.dart';

@freezed
class ChangePasswordEvent with _$ChangePasswordEvent {
  const factory ChangePasswordEvent.started() = _Started;
  const factory ChangePasswordEvent.changePassWord({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) = _ChangePassword;
}
