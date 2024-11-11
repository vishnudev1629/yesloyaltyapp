import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/model/get_support_model/get_support_model.dart';
import 'package:Yes_Loyalty/core/model/get_support_validation/get_support_validation.dart';
import 'package:Yes_Loyalty/core/services/auth_service/get_support_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_support_event.dart';
part 'get_support_state.dart';
part 'get_support_bloc.freezed.dart';

class GetSupportBloc extends Bloc<GetSupportEvent, GetSupportState> {
  GetSupportBloc() : super(GetSupportState.initial()) {
    on<_GetSupportEvent>((event, emit) async {
      emit(const GetSupportState.loading());
      final response = await GetSupportService.contactUs(
        name: event.name,
        email: event.email,
        subject: event.subject,
        message: event.message,
      );

      response.fold((failure) {
        if (failure is GetSupportValidation) {
          emit(GetSupportState.validationError(
            message: failure.data!.email!.first ?? '',
          ));
        } else {
          emit(GetSupportState.failure(failure.toString()));
        }
      }, (success) {
        emit(GetSupportState.success(success));
      });
    });
  }
}
