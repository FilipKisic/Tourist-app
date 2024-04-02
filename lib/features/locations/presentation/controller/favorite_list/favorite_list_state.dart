import 'package:tourist_app/features/locations/domain/entity/sight.dart';

sealed class FavoriteListState {}

class FavoriteListStateEmpty extends FavoriteListState {}

class FavoriteListStateFavorites extends FavoriteListState {
  final List<Sight> favorites;

  FavoriteListStateFavorites(this.favorites);
}
