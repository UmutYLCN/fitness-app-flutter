import 'package:equatable/equatable.dart';
import 'package:fitness_app/data/models/exercise.dart';

class ExerciseState extends Equatable {
  final List<Exercise> exercises;

  const ExerciseState({
    required this.exercises,
  });
  const ExerciseState.initial({
    this.exercises = const [],
  });

  ExerciseState copyWith({
    List<Exercise>? Exercises,
  }) {
    return ExerciseState(
      exercises: Exercises ?? this.exercises,
    );
  }

  @override
  List<Object> get props => [exercises];
}
