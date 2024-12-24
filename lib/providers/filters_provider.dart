import 'package:catalogs_app/providers/armies_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  xenos,
  chaos,
  imperial,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.xenos: false,
          Filter.chaos: false,
          Filter.imperial: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredArmiesProvider = Provider((ref) {
  final armies = ref.watch(armiesProvider);
  final activeFilters = ref.watch(filtersProvider);

  return armies.where((armie) {
    if (activeFilters[Filter.xenos]! && !armie.isXenos) {
      return false;
    }
    if (activeFilters[Filter.chaos]! && !armie.isChaos) {
      return false;
    }
    if (activeFilters[Filter.imperial]! && !armie.isImperium) {
      return false;
    }
    return true;
  }).toList();
});
