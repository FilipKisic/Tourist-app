import 'package:dio/dio.dart';
import 'package:tourist_app/core/error/failure.dart';
import 'package:tourist_app/features/locations/data/api/sight_api.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';
import 'package:tourist_app/features/locations/domain/repository/sight_repository.dart';
import 'package:dartz/dartz.dart';

class SightRepositoryImpl implements SightRepository {
  final SightAPI sightAPI;

  const SightRepositoryImpl(this.sightAPI);

  @override
  Future<Either<Failure, List<Sight>>> getAll() async {
    try {
      final response = await sightAPI.getAllSights();
      return Right(response);
    } on DioException catch (_) {
      return const Left(Failure.networkError());
    }
  }
}
