import 'dart:convert';

import 'package:Yes_Loyalty/core/model/validation_response/validation_response.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/model/register/register.dart';
import 'package:Yes_Loyalty/core/services/auth_service/register_service.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState.initial()) {
    on<_Register>((event, emit) async {
      emit(const RegisterState.loading());
      final result = await RegsiterService.register(
        name: event.name,
        email: event.email,
        phone: event.phone,
        password: event.password,
        password_confirm: event.confirmpassword,
      );
      result.fold((failure) {
        if (failure is ValidationResponse) {
          emit(RegisterState.validationError(
            nameError: failure.data?.name?.join(', '),
            emailError: failure.data?.email?.join(', '),
            phoneError: failure.data?.phone?.join(', '),
            passwordError: failure.data?.password?.join(', '),
            passwordConfirmError: failure.data?.password_confirm?.join(', '),
          ));
        } else {
          emit(RegisterState.failure(failure.toString()));
        }
      }, (success) {
        emit(RegisterState.success(success));
      });
    });
  }
}
