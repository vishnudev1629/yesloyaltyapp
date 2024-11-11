import 'package:Yes_Loyalty/core/model/change_password_validation/change_password_validation.dart';
import 'package:Yes_Loyalty/core/services/auth_service/change_password_services.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';
part 'change_password_bloc.freezed.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(_Initial()) {
    on<_ChangePassword>((event, emit) async {
      emit(const ChangePasswordState.loading());
      final result = await ChangePassWordService.changePassword(
        confirmPassword: event.confirmPassword,
        currentPassword: event.currentPassword,
        newPassword: event.newPassword,
      );
      result.fold((failure) {
       
          emit(ChangePasswordState.validationError(
            confirmPasswordError: failure.data?.confirmPassword?.join(', '),
            currentPasswordError: failure.data?.current_password?.join(', '),
            newPasswordError: failure.data?.new_password?.join(', '),
          ));
        
      }, (success) {
        emit(ChangePasswordState.success(success));
      });
    });
  }
}
