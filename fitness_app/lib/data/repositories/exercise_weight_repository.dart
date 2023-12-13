import 'package:fitness_app/data/models/models.dart';

abstract class ExerciseWeightRepository {
  Future<void> addExerciseWeight(ExerciseWeight exerciseWeight);
  Future<void> updateExerciseWeight(ExerciseWeight exerciseWeight);
  Future<void> deleteExerciseWeight(ExerciseWeight exerciseWeight);
  Future<List<ExerciseWeight>> getAllExercisesWeight();
}
