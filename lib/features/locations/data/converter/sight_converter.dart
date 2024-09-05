import 'package:tourist_app/features/locations/data/api/model/sight_dto.dart';
import 'package:tourist_app/features/locations/data/converter/converter.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';

class SightDtoToEntityConverter implements Converter<SightDto, Sight> {
  @override
  Sight convert(final SightDto dto) => Sight(
        id: dto.id,
        title: dto.title,
        description: dto.description,
        address: dto.address,
        lat: dto.lat,
        lng: dto.lng,
        rating: dto.rating,
        imageUrl: dto.imageUrl,
      );
}

class SightEntityToDtoConverter implements Converter<Sight, SightDto> {
  @override
  SightDto convert(final Sight model) => SightDto(
        id: model.id,
        title: model.title,
        description: model.description,
        address: model.address,
        lat: model.lat,
        lng: model.lng,
        rating: model.rating,
        imageUrl: model.imageUrl,
      );
}
