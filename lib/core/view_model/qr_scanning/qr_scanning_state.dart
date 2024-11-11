part of 'qr_scanning_bloc.dart';

@freezed
// class QrScanningState with _$QrScanningState {
//   const factory QrScanningState.initial() = _Initial;
// }
class QrScanningState with _$QrScanningState {
  const factory QrScanningState.initial() = _Initial;
  const factory QrScanningState.loading() = _Loading;
  const factory QrScanningState.success(QrCreditedModel response) = _Success;
  const factory QrScanningState.failure(String error) = _Failure;
    const factory QrScanningState.validationError({
    dynamic message,
   dynamic qr_id,
  }) = _ValidationError;
}
