import 'package:dartz/dartz.dart';
import 'package:tourist_app/core/error/failure.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';

abstract interface class SightRepository {
  Future<Either<Failure, List<Sight>>> getAll();
}