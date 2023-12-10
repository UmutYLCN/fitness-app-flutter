import 'package:fitness_app/data/models/exercise.dart';

abstract class ExerciseRepository {
  Future<void> addExercise(Exercise Exercise);
  Future<void> updateExercise(Exercise Exercise);
  Future<void> deleteExercise(Exercise Exercise);
  Future<List<Exercise>> getAllExercises();
}
