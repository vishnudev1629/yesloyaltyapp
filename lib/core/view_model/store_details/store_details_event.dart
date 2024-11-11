part of 'store_details_bloc.dart';

@freezed
class StoreDetailsEvent with _$StoreDetailsEvent {
  const factory StoreDetailsEvent.started() = _Started;
  factory StoreDetailsEvent.fetchStoreDetails({required String storeId}) =
      _FetchStoreDetails;
  const factory StoreDetailsEvent.clearStoreDetailsData() =
      _ClearStoreDetailsData;
}
