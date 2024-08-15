import 'package:flutter_riverpod/flutter_riverpod.dart';

final dynamicListProvider = StateProvider<List<Map<String, dynamic>>>((ref) {
  return []; // Initial empty list of maps
});
