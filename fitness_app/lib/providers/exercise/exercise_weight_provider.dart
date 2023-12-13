import 'package:fitness_app/data/repositories/exercise_weight_repository_provider.dart';
import 'package:fitness_app/providers/exercise/exercise_weight_notfier.dart';
import 'package:fitness_app/providers/exercise/exercise_weight_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exercisesWeightProvider =
    StateNotifierProvider<ExerciseWeightNotifier, ExerciseWeightState>((ref) {
  final repository = ref.watch(ExerciseWeightRepositoryProvider);
  return ExerciseWeightNotifier(repository);
});
