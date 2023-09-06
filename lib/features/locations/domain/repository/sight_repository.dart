import 'package:tourist_app/features/locations/domain/entity/sight.dart';

abstract interface class SightRepository {
  Future<List<Sight>> getAll();
}