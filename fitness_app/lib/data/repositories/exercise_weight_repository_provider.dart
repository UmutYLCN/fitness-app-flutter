import 'package:fitness_app/data/datasource/exercise_weight_datasource_provider.dart';
import 'package:fitness_app/data/repositories/exercise_weight_repository.dart';
import 'package:fitness_app/data/repositories/exercise_weight_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ExerciseWeightRepositoryProvider =
    Provider<ExerciseWeightRepository>((ref) {
  final datasource = ref.read(ExerciseWeightDatasourceProvider);
  return ExerciseWeightRepositoryImpl(datasource);
});
