import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/services/auth_service/logout_service.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutState.initial()) {
     
    on<_Logout>((event, emit) async {
     final response = await LogoutService.logout();
      emit(state.copyWith(isLoading: true, isError: false));
      response.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          isError: true,
          statusCode: failure,
        )),
        (statusCode) => emit(state.copyWith(
          isLoading: false,
          isError: false,
          statusCode: statusCode,
        )),
      );
    });
 
  }
}
