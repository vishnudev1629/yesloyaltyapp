import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/model/store_details/store_details.dart';
import 'package:Yes_Loyalty/core/model/store_list/store_list.dart';
import 'package:Yes_Loyalty/core/services/get_service/store_service.dart';


part 'store_list_event.dart';
part 'store_list_state.dart';
part 'store_list_bloc.freezed.dart';


class StoreListBloc extends Bloc<StoreListEvent, StoreListState> {
  StoreListBloc() : super(StoreListState.initial()) {

        on<_fetchStoreList>((event, emit) async {
       final response = await StoreService.fetchStoreList();
      emit(state.copyWith(isLoading: true, isError: false));
      response.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          isError: true,
          successorFailure: optionOf(left(failure)),
        )),
        (offersList) => emit(state.copyWith(
          isLoading: false,
          isError: false,
          storeDetails: offersList,
          successorFailure: optionOf(right(offersList)),
        )),
      );
    });
  }
}


