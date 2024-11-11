part of 'profile_edit_bloc.dart';

@freezed
class ProfileEditEvent with _$ProfileEditEvent {
  const factory ProfileEditEvent.started() = _Started;
  const factory ProfileEditEvent.profileEdit({
    required String name,
    required String email,
    required String phone,
     dynamic? image,
  }) = _ProfileEdit;
}
