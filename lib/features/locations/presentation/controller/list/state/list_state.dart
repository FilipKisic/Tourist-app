import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tourist_app/core/error/failure.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';

part 'list_state.freezed.dart';

@freezed
class SightListState with _$SightListState {
  const factory SightListState.loading() = _Loading;
  const factory SightListState.empty() = _Empty;
  const factory SightListState.success(List<Sight> sights) = _Success;
  const factory SightListState.error(Failure failure) = _Failure;
}