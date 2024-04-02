import 'package:json_annotation/json_annotation.dart';

part 'sight_dto.g.dart';

@JsonSerializable()
class SightDto {
  final int id;
  final String title;
  final String? description;
  final String? address;
  final double lat;
  final double lng;
  final int rating;

  const SightDto({
    required this.id,
    required this.title,
    this.description,
    this.address,
    required this.lat,
    required this.lng,
    this.rating = 0,
  });

  factory SightDto.fromJson(final Map<String, dynamic> json) => _$SightDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SightDtoToJson(this);
}
