part of 'transaction_details_bloc.dart';

@freezed
class TransactionDetailsEvent with _$TransactionDetailsEvent {
  const factory TransactionDetailsEvent.started() = _Started;
  const factory TransactionDetailsEvent.fetchTransactionDetails() = _FetchTransactionDetails;
}