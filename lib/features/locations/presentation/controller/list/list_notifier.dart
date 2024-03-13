import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/core/di.dart';
import 'package:tourist_app/features/locations/domain/usecase/sight_usecases.dart';
import 'package:tourist_app/features/locations/presentation/controller/list/state/list_state.dart';

class SightListNotifier extends Notifier<SightListState> {
  late final SightUseCases _sightUseCases;

  @override
  SightListState build() {
    _sightUseCases = ref.watch(sightUseCasesProvider);
    getAll();
    return const SightListState.loading();
  }

  Future<void> getAll() async {
    state = const SightListState.loading();

    final result = await _sightUseCases.getAllSights();
    
    result.fold(
      (failure) => state = SightListState.error(failure),
      (list) => state = list.isEmpty ? const SightListState.empty() : SightListState.success(list),
    );
  }
}
