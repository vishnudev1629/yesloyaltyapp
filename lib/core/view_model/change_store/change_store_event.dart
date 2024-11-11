part of 'change_store_bloc.dart';

@freezed
class ChangeStoreEvent with _$ChangeStoreEvent {
  const factory ChangeStoreEvent.started() = _Started;
    const factory ChangeStoreEvent.changeMyStore({required String storeId}) = _ChangeMyStore;
}