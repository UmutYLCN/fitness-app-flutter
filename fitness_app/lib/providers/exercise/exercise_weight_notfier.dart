import 'package:fitness_app/data/models/models.dart';
import 'package:fitness_app/data/repositories/exercise_weight_repository.dart';
import 'package:fitness_app/providers/exercise/exercise_weight_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseWeightNotifier extends StateNotifier<ExerciseWeightState> {
  final ExerciseWeightRepository _repository;

  ExerciseWeightNotifier(this._repository)
      : super(const ExerciseWeightState.initial()) {
    getExercises();
  }

  Future<void> createExercise(ExerciseWeight exercise) async {
    try {
      await _repository.addExerciseWeight(exercise);
      getExercises();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteExercise(ExerciseWeight exercise) async {
    try {
      await _repository.deleteExerciseWeight(exercise);
      getExercises();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateExercise(ExerciseWeight exercise) async {
    try {
      getExercises();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getExercises() async {
    try {
      final exercises = await _repository.getAllExercisesWeight();
      state = state.copyWith(exercises: exercises);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
