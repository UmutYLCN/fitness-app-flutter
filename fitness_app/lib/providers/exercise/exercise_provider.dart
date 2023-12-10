import 'package:fitness_app/data/repositories/exercise_repository_provider.dart';
import 'package:fitness_app/providers/exercise/Exercise_notifier.dart';
import 'package:fitness_app/providers/exercise/exercise_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exercisesProvider =
    StateNotifierProvider<ExerciseNotifier, ExerciseState>((ref) {
  final repository = ref.watch(ExerciseRepositoryProvider);
  return ExerciseNotifier(repository);
});
