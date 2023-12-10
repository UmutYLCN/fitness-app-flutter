import 'package:fitness_app/data/datasource/Exercise_datasource.dart';
import 'package:fitness_app/data/models/exercise.dart';
import 'package:fitness_app/data/repositories/exercise_repository.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseDatasource _datasource;
  ExerciseRepositoryImpl(this._datasource);

  @override
  Future<void> addExercise(Exercise exercise) async {
    try {
      await _datasource.addExercise(exercise);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteExercise(Exercise exercise) async {
    try {
      await _datasource.deleteExercise(exercise);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Exercise>> getAllExercises() async {
    try {
      return await _datasource.getAllExercises();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateExercise(Exercise exercise) async {
    try {
      await _datasource.updateExercise(exercise);
    } catch (e) {
      throw '$e';
    }
  }
}
