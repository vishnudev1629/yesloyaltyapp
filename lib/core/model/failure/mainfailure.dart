import 'package:freezed_annotation/freezed_annotation.dart';
part 'mainfailure.freezed.dart';

@freezed
class MainFailure with _$MainFailure{
  const factory MainFailure.clientFailure({String? message}) = ClientFailure;
  const factory MainFailure.serverFailure() = ServerFailure;
}