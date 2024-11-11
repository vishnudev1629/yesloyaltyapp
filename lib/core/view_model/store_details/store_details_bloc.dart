import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/model/store_details/store_details.dart';
import 'package:Yes_Loyalty/core/services/get_service/store_service.dart';

part 'store_details_event.dart';
part 'store_details_state.dart';
part 'store_details_bloc.freezed.dart';

class StoreDetailsBloc extends Bloc<StoreDetailsEvent, StoreDetailsState> {
  StoreDetailsBloc() : super(StoreDetailsState.initial()) {

     on<_FetchStoreDetails>((event, emit) async {
              final response =
            await StoreService.fetchStoreDetails(storeId: event.storeId);
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
          storeDetails: storedetails,
          successorFailure: optionOf(right(storedetails)),
        )),
      );
    });
    on<_ClearStoreDetailsData>((event, emit) async {
      emit(StoreDetailsState(
          isLoading: false,
          isError: false,
          storeDetails: StoreDetails(),
          successorFailure: None()));
    });
  }
}
