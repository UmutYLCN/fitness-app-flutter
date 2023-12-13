import 'package:fitness_app/utils/exerciseWeight_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryWeightProvider =
    StateProvider.autoDispose<ExerciseWeightCategory>((ref) {
  return ExerciseWeightCategory.others;
});
