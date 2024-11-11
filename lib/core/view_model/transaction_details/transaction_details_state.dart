part of 'transaction_details_bloc.dart';

@freezed
class TransactionDetailsState with _$TransactionDetailsState {
  factory TransactionDetailsState.initial() {
    return TransactionDetailsState(
      isLoading: false,
      isError: false,
      transactionDetails: TransactionDetails(),
      successorFailure: const None(),
    );
  }
  const factory TransactionDetailsState({
    required bool isLoading,
    required bool isError,
    required TransactionDetails transactionDetails,
    required Option<Either<MainFailure, TransactionDetails>> successorFailure,
  }) = _TransactionDetailsState;
}