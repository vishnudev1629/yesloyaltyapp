import 'package:Yes_Loyalty/core/model/login_validation/login_validation.dart';
import 'package:Yes_Loyalty/core/model/reset_password_model/reset_password_model.dart';
import 'package:Yes_Loyalty/core/services/auth_service/forgot_password_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
part 'forgot_password_bloc.freezed.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordState.initial()) {
 
       on<_ForgotPassword>((event, emit) async {
      final response = await ForgotPassWordService.forgotPassword(
        email: event.email,
    
      );

      response.fold((failure) {
        if (failure is LoginValidation) {
          emit(ForgotPasswordState.validationError(
            message: failure.data!.email!.first ?? '',
          ));
        } else {
          emit(ForgotPasswordState.failure(failure.toString()));
        }
      }, (success) {
        emit(ForgotPasswordState.success(success));
      });
    });
  }
}
