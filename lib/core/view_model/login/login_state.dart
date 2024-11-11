part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.authsuccess({required Login user}) = _Authsuccess;
  const factory LoginState.authError({required String message}) = _AuthError;
  const factory LoginState.validationError({
    dynamic Error,
  }) = _ValidationError;
}
