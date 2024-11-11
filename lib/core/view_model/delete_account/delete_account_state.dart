part of 'delete_account_bloc.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  factory DeleteAccountState.initial() {
    return  DeleteAccountState(
      isLoading: false,
      isError: false,
     statusCode: 3,
    );
  }
  const factory DeleteAccountState({
    required bool isLoading,
    required bool isError,
required int statusCode, }) = _DeleteAccountState;
}
