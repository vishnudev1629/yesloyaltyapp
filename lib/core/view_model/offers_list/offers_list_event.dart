part of 'offers_list_bloc.dart';

@freezed
class OffersListEvent with _$OffersListEvent {
  const factory OffersListEvent.started() = _Started;
  const factory OffersListEvent.fetchOffersList() = _FetchOffersList;
}
