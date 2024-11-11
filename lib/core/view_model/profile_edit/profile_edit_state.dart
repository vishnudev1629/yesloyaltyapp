part of 'profile_edit_bloc.dart';

@freezed

// class ProfileEditState with _$ProfileEditState {
//   factory ProfileEditState.initial() {
//     return  ProfileEditState(
//       isLoading: false,
//       isError: false,
//       profileEditResponse:2, // Set initial value to null for dynamic type
//       successorFailure: None(),
//     );
//   }
//   const factory ProfileEditState({
//     required bool isLoading,
//     required bool isError,
//     required int profileEditResponse, // Change type to dynamic
//     required Option<Either<MainFailure, int>> successorFailure, // Change type to dynamic
//   }) = _ProfileEditState;
// }

class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState.initial() = _Initial;
  const factory ProfileEditState.loading() = _Loading;
  const factory ProfileEditState.success(dynamic response) = _Success;
  const factory ProfileEditState.failure(String error) = _Failure;
  const factory ProfileEditState.validationError({
    dynamic nameError,
    dynamic emailError,
     dynamic phoneError,
   dynamic passwordError,
   dynamic passwordConfirmError,
  }) = _ValidationError;
}