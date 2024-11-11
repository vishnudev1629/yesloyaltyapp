part of 'qr_scanning_bloc.dart';

@freezed
class QrScanningEvent with _$QrScanningEvent {
  const factory QrScanningEvent.started() = _Started;
  const factory QrScanningEvent.postscannedResult({
    required String QrId,
 
  }) = _PostscannedResult;
}
