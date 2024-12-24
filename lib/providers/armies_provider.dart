import 'package:catalogs_app/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final armiesProvider = Provider((ref) {
  return dummyArmie;
});
