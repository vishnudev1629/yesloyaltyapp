part of 'store_list_bloc.dart';

@freezed
class StoreListState with _$StoreListState {
  factory StoreListState.initial() {
    return StoreListState(
      isLoading: false,
      isError: false,
      storeDetails: StoreList(),
      successorFailure: const None(),
    );
  }
  const factory StoreListState({
    required bool isLoading,
    required bool isError,
    required StoreList storeDetails,
    required Option<Either<MainFailure, StoreList>> successorFailure,
  }) = _StoreListState;
}
