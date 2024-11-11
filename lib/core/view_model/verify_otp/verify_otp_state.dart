part of 'verify_otp_bloc.dart';

@freezed
class VerifyOtpState with _$VerifyOtpState {
  const factory VerifyOtpState.initial() = _Initial;
  const factory VerifyOtpState.loading() = _Loading;
  const factory VerifyOtpState.success(
     {ResetPasswordModel? resetPasswordModel,
    OtpVerificationResponse? otpSuccessModel}) =
      _Success;
  const factory VerifyOtpState.failure(String error) = _Failure;
  const factory VerifyOtpState.validationError({
    dynamic otpError,
 dynamic message,
 
  }) = _ValidationError;
}
