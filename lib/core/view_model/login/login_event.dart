part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;
  const factory LoginEvent.signInWithEmailAndPassword({
    required String email,
    required String password,
    String? fcm_token,
  }) = _SignInWithEmailAndPassword;
}
