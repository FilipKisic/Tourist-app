import 'package:tourist_app/core/error/failure.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';

sealed class ListState {}

class ListStateLoading extends ListState {}

class ListStateEmpty extends ListState {}

class ListStateSuccess extends ListState {
  final List<Sight> sightList;

  ListStateSuccess(this.sightList);
}

class ListStateError extends ListState {
  final Failure failure;

  ListStateError(this.failure);
}
