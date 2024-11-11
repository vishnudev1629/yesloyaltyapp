

part of 'register_bloc.dart';

@freezed

class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.success(dynamic response) = _Success;
  const factory RegisterState.failure(String error) = _Failure;
  const factory RegisterState.validationError({
    dynamic nameError,
    dynamic emailError,
     dynamic phoneError,
   dynamic passwordError,
   dynamic passwordConfirmError,
  }) = _ValidationError;
}