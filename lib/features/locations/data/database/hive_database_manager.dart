import 'package:hive_flutter/hive_flutter.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';

const sightsBoxName = 'sights';

class HiveDatabaseManager {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter<Sight>(SightAdapter());
    await Hive.openBox<Sight>(sightsBoxName);
  }

  void setFavorite(final Sight sight) {
    final Box<Sight> box = Hive.box<Sight>(sightsBoxName);

    if (_sightIsNotFavoriteYet(box, sight)) {
      box.put(sight.id, sight);
    }
  }

  bool _sightIsNotFavoriteYet(final Box<Sight> box, final Sight sight) =>
      !box.values.toList().contains(sight);

  List<Sight> getAll() => Hive.box<Sight>(sightsBoxName).values.toList();

  Future<void> removeFavorite(final Sight sight) async {
    final Box<Sight> box = await Hive.openBox<Sight>(sightsBoxName);
    box.delete(sight.id);
  }
}
