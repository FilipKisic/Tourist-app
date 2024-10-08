import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tourist_app/features/locations/data/api/model/sight_dto.dart';

part 'sight_api.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8080/sight')
abstract class SightAPI {
  factory SightAPI(Dio dio, {String baseUrl}) = _SightAPI;

  @GET('/all')
  Future<List<SightDto>> getAllSights();
}
