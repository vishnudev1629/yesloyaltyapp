part of 'user_details_bloc.dart';

@freezed
class UserDetailsEvent with _$UserDetailsEvent {
  const factory UserDetailsEvent.started() = _Started;
    const factory UserDetailsEvent.fetchUserDetails() = _FetchUserDetails;
}