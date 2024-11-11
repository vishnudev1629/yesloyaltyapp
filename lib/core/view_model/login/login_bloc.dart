import 'package:Yes_Loyalty/core/model/login_validation/login_validation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/login/login.dart';
import 'package:Yes_Loyalty/core/services/auth_service/login_services.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_SignInWithEmailAndPassword>((event, emit) async {
      emit(const LoginState.loading());

      try {
        final result = await LoginService.login(
          email: event.email,
          password: event.password,
          fcm_token: event?.fcm_token,
        );

        await result.fold((failure) async {
          if (failure is LoginValidation) {
            final emailError = failure.data?.email?.join(', ');
            final passwordError = failure.data?.password?.join(', ');
            final error = emailError ?? passwordError; // Prioritize email error

            emit(LoginState.validationError(Error: error));
          } else {
            emit(LoginState.authError(message: failure.data.toString()));
          }
        }, (success) async {
          // var accessToken = await SetSharedPreferences.storeAccessToken(
          //         success.misc.accessToken) ??
          //     'Access Token empty';
          print(success.misc.accessToken);
          emit(LoginState.authsuccess(user: success));
        });
      } catch (e) {
        emit(LoginState.authError(message: 'An error occurred: $e'));
      }
    });
  }
}
