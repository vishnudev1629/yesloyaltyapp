import 'package:Yes_Loyalty/core/model/change_store/change_store.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/services/post_service/change_store_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_store_event.dart';
part 'change_store_state.dart';
part 'change_store_bloc.freezed.dart';

class ChangeStoreBloc extends Bloc<ChangeStoreEvent, ChangeStoreState> {
  ChangeStoreBloc() : super(ChangeStoreState.initial()) {
    on<_ChangeMyStore>((event, emit) async {
      final response = await ChangeStoreService.changeStore(storeId: '8');
      emit(state.copyWith(isLoading: true, isError: false));
      response.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          isError: true,
          successorFailure: optionOf(left(failure)),
        )),
        (changeStore) => emit(state.copyWith(
          isLoading: false,
          isError: false,
          changeStore: changeStore,
          successorFailure: optionOf(right(changeStore)),
        )),
      );
    });
  }
}
