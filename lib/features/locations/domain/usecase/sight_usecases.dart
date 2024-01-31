import 'package:dartz/dartz.dart';
import 'package:tourist_app/core/error/failure.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';
import 'package:tourist_app/features/locations/domain/repository/sight_repository.dart';

class SightUseCases {
  final SightRepository sightRepository;

  const SightUseCases(this.sightRepository);

  Future<Either<Failure, List<Sight>>> getAllSights() => sightRepository.getAll();
}
