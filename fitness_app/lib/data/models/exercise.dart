import 'package:equatable/equatable.dart';
import 'package:fitness_app/utils/exercise_category.dart';
import 'package:fitness_app/utils/exercise_keys.dart';

class Exercise extends Equatable {
  final int? id;
  final String title;
  final String note;
  final ExerciseCategory category;
  final String time;
  final String date;
  final bool isCompleted;
  const Exercise({
    this.id,
    required this.title,
    required this.category,
    required this.time,
    required this.date,
    required this.note,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ExerciseKeys.id: id,
      ExerciseKeys.title: title,
      ExerciseKeys.note: note,
      ExerciseKeys.category: category.name,
      ExerciseKeys.time: time,
      ExerciseKeys.date: date,
      ExerciseKeys.isCompleted: isCompleted ? 1 : 0,
    };
  }

  factory Exercise.fromJson(Map<String, dynamic> map) {
    return Exercise(
      id: map[ExerciseKeys.id],
      title: map[ExerciseKeys.title],
      note: map[ExerciseKeys.note],
      category:
          ExerciseCategory.stringToExerciseCategory(map[ExerciseKeys.category]),
      time: map[ExerciseKeys.time],
      date: map[ExerciseKeys.date],
      isCompleted: map[ExerciseKeys.isCompleted] == 1 ? true : false,
    );
  }

  @override
  List<Object> get props {
    return [
      title,
      note,
      category,
      time,
      date,
      isCompleted,
    ];
  }

  Exercise copyWith({
    int? id,
    String? title,
    String? note,
    ExerciseCategory? category,
    String? time,
    String? date,
    bool? isCompleted,
  }) {
    return Exercise(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      category: category ?? this.category,
      time: time ?? this.time,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
