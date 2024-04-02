import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/core/di.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';
import 'package:tourist_app/features/locations/domain/usecase/sight_usecases.dart';
import 'package:tourist_app/features/locations/presentation/controller/favorite_list/favorite_list_state.dart';

class FavoriteListNotifier extends Notifier<FavoriteListState> {
  late final SightUseCases _sightUseCases;

  @override
  FavoriteListState build() {
    _sightUseCases = ref.watch(sightUseCasesProvider);
    getAllFavorites();
    return state;
  }

  void getAllFavorites() {
    final list = _sightUseCases.getAllFavorites();
    state = list.isEmpty ? FavoriteListStateEmpty() : FavoriteListStateFavorites(list);
  }

  void setFavorite(final Sight sight) {
    sight.isFavorite = true;
    _sightUseCases.setFavorite(sight);
    getAllFavorites();
    ref.read(sightListProvider.notifier).updateWithValue(sight);
  }

  void removeFavorite(final Sight sight) async {
    sight.isFavorite = false;
    await _sightUseCases.removeFavorite(sight);
    getAllFavorites();
    ref.read(sightListProvider.notifier).updateWithValue(sight);
  }
}
