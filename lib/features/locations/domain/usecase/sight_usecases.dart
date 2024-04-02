import 'package:dartz/dartz.dart';
import 'package:tourist_app/core/error/failure.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';
import 'package:tourist_app/features/locations/domain/repository/sight_repository.dart';

class SightUseCases {
  final SightRepository _sightRepository;

  const SightUseCases(this._sightRepository);

  Future<Either<Failure, List<Sight>>> getAllSights() => _sightRepository.getAll();

  List<Sight> getAllFavorites() => _sightRepository.getAllFavorites();

  void setFavorite(final Sight sight) => _sightRepository.setFavorite(sight);

  Future<void> removeFavorite(final Sight sight) => _sightRepository.removeFavorite(sight);
}
