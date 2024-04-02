// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sight_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SightDto _$SightDtoFromJson(Map<String, dynamic> json) => SightDto(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
      address: json['address'] as String?,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      rating: json['rating'] as int? ?? 0,
    );

Map<String, dynamic> _$SightDtoToJson(SightDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'rating': instance.rating,
    };
