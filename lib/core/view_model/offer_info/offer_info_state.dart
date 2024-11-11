part of 'offer_info_bloc.dart';

@freezed

class OfferInfoState with _$OfferInfoState {
  factory OfferInfoState.initial() {
    return OfferInfoState(
      isLoading: false,
      isError: false,
      offersInfo: OffersInfo(),
      successorFailure: const None(),
    );
  }
  const factory OfferInfoState({
    required bool isLoading,
    required bool isError,
    required OffersInfo offersInfo,
    required Option<Either<MainFailure, OffersInfo>> successorFailure,
  }) = _OfferInfoState;
}