part of 'store_details_bloc.dart';

@freezed


class StoreDetailsState with _$StoreDetailsState {
  factory StoreDetailsState.initial() {
    return StoreDetailsState(
      isLoading: false,
      isError: false,
      storeDetails: StoreDetails(),
      successorFailure: const None(),
    );
  }
  const factory StoreDetailsState({
    required bool isLoading,
    required bool isError,
    required StoreDetails storeDetails,
    required Option<Either<MainFailure, StoreDetails>> successorFailure,
  }) = _StoreDetailsState;
}