part of 'offers_list_bloc.dart';

@freezed
class OffersListState with _$OffersListState {
  factory OffersListState.initial() {
    return OffersListState(
      isLoading: false,
      isError: false,
      offersList: OffersList(),
      successorFailure: const None(),
    );
  }
  const factory OffersListState({
    required bool isLoading,
    required bool isError,
    required OffersList offersList,
    required Option<Either<MainFailure, OffersList>> successorFailure,
  }) = _OffersListState;
}