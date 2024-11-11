import 'package:Yes_Loyalty/core/model/login_validation/login_validation.dart';
import 'package:Yes_Loyalty/core/model/otp_failure_model/otp_failure_model.dart';
import 'package:Yes_Loyalty/core/model/otp_success_model/otp_success_model.dart';
import 'package:Yes_Loyalty/core/model/reset_password_model/reset_password_model.dart';
import 'package:Yes_Loyalty/core/services/auth_service/forgot_password_service.dart';
import 'package:Yes_Loyalty/core/services/auth_service/verify_otp_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';
part 'verify_otp_bloc.freezed.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent ,VerifyOtpState> {
  VerifyOtpBloc() : super(_Initial()) {
    on<_VerifyOtpEvent>((event, emit) async {
      final response = await verifyOtpService.verifyOtp(
        email: event.email,
        otp: event.otp,
      
      );

      response.fold((failure) {
        if (failure is OtpFailureModel) {
          emit(VerifyOtpState.validationError(
            otpError:  failure.data?.otp?.join(', '),
       
          ));
        } else {
          emit(VerifyOtpState.failure(failure.toString()));
        }
      }, (success) {
        emit(VerifyOtpState.success(otpSuccessModel: success));
      });
    });
 
        on<_ForgotPassword>((event, emit) async {
      final response = await ForgotPassWordService.forgotPassword(
        email: event.email,
    
      );

      response.fold((failure) {
        if (failure is LoginValidation) {
          emit(VerifyOtpState.validationError(
            message: failure.data!.email!.first ?? '',
            
          ));
        } else {
          emit(VerifyOtpState.failure(failure.toString()));
        }
      }, (success) {
        emit(VerifyOtpState.success(resetPasswordModel: success));
      });
    });
 
  }
}


