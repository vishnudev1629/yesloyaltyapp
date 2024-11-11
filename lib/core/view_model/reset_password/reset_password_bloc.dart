import 'package:Yes_Loyalty/core/model/otp_success_model/otp_success_model.dart';
import 'package:Yes_Loyalty/core/model/reset_password_model/reset_password_model.dart';
import 'package:Yes_Loyalty/core/model/validation_response/validation_response.dart';
import 'package:Yes_Loyalty/core/services/auth_service/reset_password_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';
part 'reset_password_bloc.freezed.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(_Initial()) {
    on<_ResetPasswordEvent>((event, emit) async {
      emit(const ResetPasswordState.loading());
      final result = await ResetPasswordService.verifyOtp(
        remember_token: event.remember_token,
        password: event.password,
        password_confirm: event.password_confirm,
      );
      result.fold((failure) {
        if (failure is ValidationResponse) {
          emit(ResetPasswordState.validationError(
            passwordError: failure.data?.password_confirm?.join(', '),
            passwordConfirmError: failure.data?.password_confirm?.join(', '),
          ));
        } else {
          emit(ResetPasswordState.failure(failure.toString()));
        }
      }, (success) {
        emit(ResetPasswordState.success(success));
      });
    });
  }
}
