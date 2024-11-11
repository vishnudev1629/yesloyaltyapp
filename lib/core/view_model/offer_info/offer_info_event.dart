part of 'offer_info_bloc.dart';

@freezed
class OfferInfoEvent with _$OfferInfoEvent {
  const factory OfferInfoEvent.started() = _Started;
  const factory OfferInfoEvent.fetchOffersInfo() = _FetchOffersInfo;
}