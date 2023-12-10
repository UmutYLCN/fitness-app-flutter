import 'package:fitness_app/utils/exercise_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = StateProvider.autoDispose<ExerciseCategory>((ref) {
  return ExerciseCategory.others;
});
