import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catalogs_app/models/armie.dart';

class FavoriteArmiesNotifier extends StateNotifier<List<Armie>> {
  FavoriteArmiesNotifier() : super([]);

  bool toggleArmieFavoriteStatus(Armie armie) {
    final armieIsFavorite = state.contains(armie);

    if (armieIsFavorite) {
      state = state.where((a) => a.id != armie.id).toList();
      return false;
    } else {
      state = [...state, armie];
      return true;
    }
  }
}

final favoriteArmiesProvider =
    StateNotifierProvider<FavoriteArmiesNotifier, List<Armie>>((ref) {
  return FavoriteArmiesNotifier();
}); //optimized for data that can change.
