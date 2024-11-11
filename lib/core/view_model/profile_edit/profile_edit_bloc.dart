import 'package:Yes_Loyalty/core/model/register/register.dart';
import 'package:Yes_Loyalty/core/model/validation_response/validation_response.dart';
import 'package:Yes_Loyalty/core/view_model/user_details/user_details_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/services/post_service/profile_edit_service.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';
part 'profile_edit_bloc.freezed.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  ProfileEditBloc() : super(ProfileEditState.initial()) {
    on<_ProfileEdit>((event, emit) async {
      emit(const ProfileEditState.loading());
      final result = await ProfileEditService.editProfile(
        name: event.name,
        email: event.email,
        phone: event.phone,
        image: event.image,
      );
      result.fold((failure) {
        if (failure is ValidationResponse) {
          emit(ProfileEditState.validationError(
            nameError: failure.data?.name?.join(', '),
            emailError: failure.data?.email?.join(', '),
            phoneError: failure.data?.phone?.join(', '),
          ));
        } else {
          emit(ProfileEditState.failure('Sorry we are currently unavailable!'));
        }
      }, (success) {
        emit(ProfileEditState.success(success));
      });
    });
  }
}
