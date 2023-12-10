import 'package:equatable/equatable.dart';
import 'package:fitness_app/data/models/exercise.dart';

class ExerciseState extends Equatable {
  final List<Exercise> Exercises;

  const ExerciseState({
    required this.Exercises,
  });
  const ExerciseState.initial({
    this.Exercises = const [],
  });

  ExerciseState copyWith({
    List<Exercise>? Exercises,
  }) {
    return ExerciseState(
      Exercises: Exercises ?? this.Exercises,
    );
  }

  @override
  List<Object> get props => [Exercises];
}
