import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/model/user_details/user_details.dart';
import 'package:Yes_Loyalty/core/services/get_service/user_details_service.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';
part 'user_details_bloc.freezed.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(UserDetailsState.initial()) {

         on<_FetchUserDetails>((event, emit) async {
      final response = await FetchUserService.fetchUserData();
      emit(state.copyWith(isLoading: true, isError: false));
      response.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          isError: true,
          successorFailure: optionOf(left(failure)),
        )),
        (storedetails) => emit(state.copyWith(
          isLoading: false,
          isError: false,
          userDetails: storedetails,
          successorFailure: optionOf(right(storedetails)),
        )),
      );
    });
  }
}
