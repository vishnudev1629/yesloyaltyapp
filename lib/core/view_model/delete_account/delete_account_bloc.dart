import 'package:Yes_Loyalty/core/model/account_delete_model/account_delete_model.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/services/auth_service/delete_account_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';
part 'delete_account_bloc.freezed.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountBloc() : super(DeleteAccountState.initial()) {
    on<_DeleteAccount>((event, emit) async {
      final response = await DeleteAccountService.deleteAccount();
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
