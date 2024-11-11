part of 'store_list_bloc.dart';

@freezed
class StoreListEvent with _$StoreListEvent {
  const factory StoreListEvent.started() = _Started;
   const factory StoreListEvent.fetchStoreList() = _fetchStoreList;
}