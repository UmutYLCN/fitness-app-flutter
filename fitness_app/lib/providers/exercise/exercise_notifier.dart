import 'package:fitness_app/data/models/exercise.dart';
import 'package:fitness_app/data/repositories/exercise_repository.dart';
import 'package:fitness_app/providers/exercise/exercise_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseNotifier extends StateNotifier<ExerciseState> {
  final ExerciseRepository _repository;

  ExerciseNotifier(this._repository) : super(const ExerciseState.initial()) {
    getExercises();
  }

  Future<void> createExercise(Exercise exercise) async {
    try {
      await _repository.addExercise(exercise);
      getExercises();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteExercise(Exercise exercise) async {
    try {
      await _repository.deleteExercise(exercise);
      getExercises();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateExercise(Exercise exercise) async {
    try {
      final isCompleted = !exercise.isCompleted;
      final updatedExercise = exercise.copyWith(isCompleted: isCompleted);
      await _repository.updateExercise(updatedExercise);
      getExercises();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getExercises() async {
    try {
      final exercises = await _repository.getAllExercises();
      state = state.copyWith(Exercises: exercises);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
