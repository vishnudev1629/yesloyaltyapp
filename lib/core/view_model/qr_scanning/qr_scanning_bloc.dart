import 'package:Yes_Loyalty/core/model/qr_credited_model/qr_credited_model.dart';
import 'package:Yes_Loyalty/core/model/qr_validationresponse/qr_validationresponse.dart';
import 'package:Yes_Loyalty/core/model/validation_response/validation_response.dart';
import 'package:Yes_Loyalty/core/services/post_service/qr_post_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_scanning_event.dart';
part 'qr_scanning_state.dart';
part 'qr_scanning_bloc.freezed.dart';

class QrScanningBloc extends Bloc<QrScanningEvent, QrScanningState> {
  QrScanningBloc() : super(QrScanningState.initial()) {
    on<_PostscannedResult>((event, emit) async {
      emit(const QrScanningState.loading());
      final result = await QRPostService.postQrResponse(
        qr_id: event.QrId.toString(),
      );
      result.fold((failure) {
        if (failure is QrValidationresponse) {
          emit(QrScanningState.validationError(
            message: failure.message.toString(),
            qr_id: failure.data?.qrId?.join(', '),
          ));
        } else {
          emit(QrScanningState.failure(failure.toString()));
        }
      }, (success) {
        emit(QrScanningState.success(success));
      });
    });
  }
}
