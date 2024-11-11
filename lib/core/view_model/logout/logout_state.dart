part of 'logout_bloc.dart';

@freezed


class LogoutState with _$LogoutState {
  factory LogoutState.initial() {
    return LogoutState(
      isLoading: false,
      isError: false,
      statusCode: 3,
    );
  }
  const factory LogoutState({
    required bool isLoading,
    required bool isError,
    required int statusCode,
  }) = _LogoutState;
}
