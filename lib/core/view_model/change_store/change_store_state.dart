part of 'change_store_bloc.dart';

@freezed


class ChangeStoreState with _$ChangeStoreState {
  factory ChangeStoreState.initial() {
    return ChangeStoreState(
      isLoading: false,
      isError: false,
      changeStore: ChangeStore(),
      successorFailure: const None(),
    );
  }
  const factory ChangeStoreState({
    required bool isLoading,
    required bool isError,
    required ChangeStore changeStore,
    required Option<Either<MainFailure, ChangeStore>> successorFailure,
  }) = _ChangeStoreState;
}