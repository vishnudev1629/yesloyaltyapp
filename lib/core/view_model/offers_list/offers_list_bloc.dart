import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/model/offers_list/offers_list.dart';
import 'package:Yes_Loyalty/core/services/get_service/offers_service.dart';

part 'offers_list_event.dart';
part 'offers_list_state.dart';
part 'offers_list_bloc.freezed.dart';

class OffersListBloc extends Bloc<OffersListEvent, OffersListState> {
  OffersListBloc() : super(OffersListState.initial()) {
    on<_FetchOffersList>((event, emit) async {
      emit(state.copyWith(isLoading: true, isError: false));
      final response = await OffersService.fetchOfferListData();

      response.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          isError: true,
          successorFailure: optionOf(left(failure)),
        )),
        (offersList) => emit(state.copyWith(
          isLoading: false,
          isError: false,
          offersList: offersList,
          successorFailure: optionOf(right(offersList)),
        )),
      );
    });
  }
}
