import 'package:fitness_app/data/datasource/exercise_datasource_provider.dart';
import 'package:fitness_app/data/repositories/exercise_repository.dart';
import 'package:fitness_app/data/repositories/exercise_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ExerciseRepositoryProvider = Provider<ExerciseRepository>((ref) {
  final datasource = ref.read(ExerciseDatasourceProvider);
  return ExerciseRepositoryImpl(datasource);
});
