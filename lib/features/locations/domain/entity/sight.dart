import 'package:json_annotation/json_annotation.dart';

part 'sight.g.dart';

@JsonSerializable()
class Sight {
  final int id;
  final String name;
  final String? description;
  final String? address;
  final double lat;
  final double lng;
  final int rating;

  const Sight({
    required this.id,
    required this.name,
    this.description,
    this.address,
    required this.lat,
    required this.lng,
    this.rating = 0,
  });

  factory Sight.fromJson(final Map<String, dynamic> json) => _$SightFromJson(json);

  Map<String, dynamic> toJson() => _$SightToJson(this);
}