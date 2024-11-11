import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/model/offers_info/offers_info.dart';
import 'package:Yes_Loyalty/core/services/get_service/offers_service.dart';

part 'offer_info_event.dart';
part 'offer_info_state.dart';
part 'offer_info_bloc.freezed.dart';


class OfferInfoBloc extends Bloc<OfferInfoEvent, OfferInfoState> {
  OfferInfoBloc() : super(OfferInfoState.initial()) {

     on<_FetchOffersInfo>((event, emit) async {
        final response = await OffersService.fetchOfferInfo();
      emit(state.copyWith(isLoading: true, isError: false));
      response.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          isError: true,
          successorFailure: optionOf(left(failure)),
        )),
        (offerinfo) => emit(state.copyWith(
          isLoading: false,
          isError: false,
          offersInfo: offerinfo,
          successorFailure: optionOf(right(offerinfo)),
        )),
      );
    });
  }
}

