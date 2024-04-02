import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourist_app/core/error/failure.dart';
import 'package:tourist_app/features/locations/data/api/sight_api.dart';
import 'package:tourist_app/features/locations/data/converter/sight_converter.dart';
import 'package:tourist_app/features/locations/data/database/hive_database_manager.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';
import 'package:tourist_app/features/locations/domain/repository/sight_repository.dart';

class SightRepositoryImpl implements SightRepository {
  final SightAPI _sightAPI;
  final HiveDatabaseManager _databaseManager;

  final SightDtoToEntityConverter _dtoToEntityConverter;

  const SightRepositoryImpl(
    this._sightAPI,
    this._databaseManager,
    this._dtoToEntityConverter,
  );

  @override
  Future<Either<Failure, List<Sight>>> getAll() async {
    try {
      final response = await _sightAPI.getAllSights();
      final favorites = _databaseManager.getAll();

      final remoteSights = response.map((sight) => _dtoToEntityConverter.convert(sight)).toList();
      final result = _applyFavoriteFlags(favorites, remoteSights);
      
      return Right(result);
    } on DioException catch (_) {
      return const Left(Failure.networkError());
    }
  }

  List<Sight> _applyFavoriteFlags(
    final List<Sight> favoriteSights,
    final List<Sight> remoteSights,
  ) {
    for (var sight in remoteSights) {
      if (favoriteSights.contains(sight)) {
        sight.isFavorite = true;
      }
    }
    return remoteSights;
  }

  @override
  List<Sight> getAllFavorites() => _databaseManager.getAll().toList();

  @override
  void setFavorite(final Sight sight) => _databaseManager.setFavorite(sight);

  @override
  Future<void> removeFavorite(final Sight sight) => _databaseManager.removeFavorite(sight);
}
