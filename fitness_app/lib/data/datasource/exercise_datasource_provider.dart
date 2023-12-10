import 'package:fitness_app/data/datasource/Exercise_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ExerciseDatasourceProvider = Provider<ExerciseDatasource>((ref) {
  return ExerciseDatasource();
});
