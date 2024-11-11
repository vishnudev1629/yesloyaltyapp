part of 'user_details_bloc.dart';

@freezed


class UserDetailsState with _$UserDetailsState {
  factory UserDetailsState.initial() {
    return UserDetailsState(
      isLoading: false,
      isError: false,
      userDetails: UserDetails(),
      successorFailure: const None(),
    );
  }
  const factory UserDetailsState({
    required bool isLoading,
    required bool isError,
    required UserDetails userDetails,
    required Option<Either<MainFailure, UserDetails>> successorFailure,
  }) = _UserDetailsState;
}

