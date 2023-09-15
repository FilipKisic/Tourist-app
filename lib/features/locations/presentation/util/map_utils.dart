import 'package:map_launcher/map_launcher.dart';

class MapUtils {
  static Future<void> openLocationInMaps(final double lat, final double lng, final title) async {
    final availableMaps = await MapLauncher.installedMaps;

    await availableMaps.first.showMarker(
      coords: Coords(lat, lng),
      title: title,
    );
  }
}
