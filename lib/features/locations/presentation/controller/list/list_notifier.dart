import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/core/di.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';
import 'package:tourist_app/features/locations/domain/usecase/sight_usecases.dart';
import 'package:tourist_app/features/locations/presentation/controller/list/list_state.dart';

class SightListNotifier extends Notifier<ListState> {
  late final SightUseCases _sightUseCases;

  @override
  ListState build() {
    _sightUseCases = ref.watch(sightUseCasesProvider);
    getAll();
    return ListStateLoading();
  }

  Future<void> getAll() async {
    state = ListStateLoading();

    final result = await _sightUseCases.getAllSights();

    result.fold(
      (failure) => state = ListStateError(failure),
      (list) => state = list.isEmpty ? ListStateEmpty() : ListStateSuccess(list),
    );
  }

  void updateWithValue(final Sight sight) {
    if (state is ListStateSuccess) {
      final list = (state as ListStateSuccess).sightList;
      final index = list.indexWhere((s) => s.id == sight.id);
      list[index] = sight;
      state = ListStateSuccess(list);
    }
  }
}
