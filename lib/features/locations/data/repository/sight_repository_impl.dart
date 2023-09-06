import 'package:tourist_app/features/locations/data/api/sight_api.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';
import 'package:tourist_app/features/locations/domain/repository/sight_repository.dart';

class SightRepositoryImpl implements SightRepository {
  final SightAPI sightAPI;

  const SightRepositoryImpl(this.sightAPI);

  @override
  Future<List<Sight>> getAll() async => sightAPI.getAllSights();
}
