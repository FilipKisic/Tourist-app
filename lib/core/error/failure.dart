import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.networkError() = _NetworkError;
}