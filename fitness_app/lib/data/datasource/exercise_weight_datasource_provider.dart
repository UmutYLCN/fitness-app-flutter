import 'package:fitness_app/data/datasource/exercise_weight_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ExerciseWeightDatasourceProvider =
    Provider<ExerciseWeightDatasource>((ref) {
  return ExerciseWeightDatasource();
});
