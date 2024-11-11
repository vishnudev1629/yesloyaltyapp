part of 'verify_otp_bloc.dart';

@freezed
class VerifyOtpEvent with _$VerifyOtpEvent {
  const factory VerifyOtpEvent.started() = _Started;
  const factory VerifyOtpEvent.resetPassword({
    required String email,
    required String otp,
  }) = _VerifyOtpEvent;
  const factory VerifyOtpEvent.forgotPassword({required String email}) =
      _ForgotPassword;
}
