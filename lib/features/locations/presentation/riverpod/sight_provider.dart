import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';
import 'package:tourist_app/features/locations/domain/usecase/sight_usecases.dart';

class SightProvider extends ChangeNotifier {
  final SightUseCases sightUseCases;

  SightProvider(this.sightUseCases) {
    getAll();
  }

  AsyncValue<List<Sight>>? sightListState;

  void getAll() async {
    sightListState = const AsyncValue.loading();
    notifyListeners();

    sightListState = await AsyncValue.guard(() => sightUseCases.getAllSights());
    notifyListeners();
  }
}
