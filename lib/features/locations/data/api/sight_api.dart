import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';

part 'sight_api.g.dart';

@RestApi(baseUrl: 'http://localhost:8080/sight')
abstract class SightAPI {
  factory SightAPI(Dio dio, {String baseUrl}) = _SightAPI;

  @GET('/all')
  Future<List<Sight>> getAllSights();
}