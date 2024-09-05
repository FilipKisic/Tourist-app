import 'package:hive/hive.dart';

part 'sight.g.dart';

@HiveType(typeId: 0)
class Sight extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? address;

  @HiveField(4)
  double lat;

  @HiveField(5)
  double lng;

  @HiveField(6)
  int rating;

  @HiveField(7)
  bool isFavorite;

  @HiveField(8)
  String imageUrl;

  Sight({
    required this.id,
    required this.title,
    this.description,
    this.address,
    required this.lat,
    required this.lng,
    required this.rating,
    this.isFavorite = false,
    required this.imageUrl,
  });

  @override
  String toString() => '$id, $title, $lat, $lng';

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Sight &&
        other.id == id &&
        other.title == title &&
        other.lat == lat &&
        other.lng == lng;
  }

  @override
  int get hashCode => Object.hash(id, title, lat, lng);
}
