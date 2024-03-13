import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.networkError() = _NetworkError;
  const factory Failure.firebaseError(String error) = _FirebaseError;
  const factory Failure.generalError() = _General;
}