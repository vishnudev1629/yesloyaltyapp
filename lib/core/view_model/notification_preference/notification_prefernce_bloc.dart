import 'package:Yes_Loyalty/core/model/offer_notfication_prefence_model/offer_notfication_prefence_model.dart';
import 'package:Yes_Loyalty/core/services/offer_service/offer_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_prefernce_event.dart';
part 'notification_prefernce_state.dart';
part 'notification_prefernce_bloc.freezed.dart';

class NotificationPrefernceBloc
    extends Bloc<NotificationPrefernceEvent, NotificationPrefernceState> {
  NotificationPrefernceBloc() : super(_Initial()) {
    on<_ChangeNotificationPrefernce>((event, emit) async {
      emit(NotificationPrefernceState.loading());
      final response = await OfferNotificationPreferenceService
          .changeNotificationPreferencee(
        offer_notify: event.offer_notify,
      );

      response.fold(
        (failure) => emit(NotificationPrefernceState.failure('error')),
        (offersList) => emit(NotificationPrefernceState.success(offersList)),
      );
    });
  }
}
