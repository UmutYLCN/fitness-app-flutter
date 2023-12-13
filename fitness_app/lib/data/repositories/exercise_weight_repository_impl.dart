import 'package:fitness_app/data/datasource/exercise_weight_datasource.dart';
import 'package:fitness_app/data/models/models.dart';
import 'package:fitness_app/data/repositories/exercise_weight_repository.dart';

class ExerciseWeightRepositoryImpl implements ExerciseWeightRepository {
  final ExerciseWeightDatasource _datasource;
  ExerciseWeightRepositoryImpl(this._datasource);

  @override
  Future<void> addExerciseWeight(ExerciseWeight exerciseWeight) async {
    try {
      await _datasource.addExercise(exerciseWeight);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteExerciseWeight(ExerciseWeight exerciseWeight) async {
    try {
      await _datasource.deleteExerciseWeight(exerciseWeight);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<ExerciseWeight>> getAllExercisesWeight() async {
    try {
      return await _datasource.getAllExercisesWeight();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateExerciseWeight(ExerciseWeight exerciseWeight) async {
    try {
      await _datasource.updateExerciseWeight(exerciseWeight);
    } catch (e) {
      throw '$e';
    }
  }
}
