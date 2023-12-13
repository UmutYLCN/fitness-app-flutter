import 'package:equatable/equatable.dart';
import 'package:fitness_app/data/models/models.dart';

class ExerciseWeightState extends Equatable {
  final List<ExerciseWeight> exercises;

  const ExerciseWeightState({
    required this.exercises,
  });
  const ExerciseWeightState.initial({
    this.exercises = const [],
  });

  ExerciseWeightState copyWith({
    List<ExerciseWeight>? exercises,
  }) {
    return ExerciseWeightState(
      exercises: exercises ?? this.exercises,
    );
  }

  @override
  List<Object> get props => [exercises];
}
