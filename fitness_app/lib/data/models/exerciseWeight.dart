import 'package:equatable/equatable.dart';
import 'package:fitness_app/utils/exerciseWeight_category.dart';
import 'package:fitness_app/utils/exerciseWeight_keys.dart';
import 'package:fitness_app/utils/exercise_keys.dart';

class ExerciseWeight extends Equatable {
  final int? id;
  final String title;
  final String note;
  final ExerciseWeightCategory category;
  final String kg;
  final String date;

  const ExerciseWeight({
    this.id,
    required this.title,
    required this.category,
    required this.kg,
    required this.date,
    required this.note,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ExerciseWeightKeys.id: id,
      ExerciseWeightKeys.title: title,
      ExerciseWeightKeys.note: note,
      ExerciseWeightKeys.category: category.name,
      ExerciseWeightKeys.kg: kg,
      ExerciseWeightKeys.date: date,
    };
  }

  factory ExerciseWeight.fromJson(Map<String, dynamic> map) {
    return ExerciseWeight(
      id: map[ExerciseWeightKeys.id],
      title: map[ExerciseWeightKeys.title],
      note: map[ExerciseWeightKeys.note],
      category: ExerciseWeightCategory.stringToExerciseWeightCategory(
          map[ExerciseWeightKeys.category]),
      kg: map[ExerciseWeightKeys.kg],
      date: map[ExerciseKeys.date],
    );
  }

  @override
  List<Object> get props {
    return [
      title,
      note,
      category,
      kg,
      date,
    ];
  }

  ExerciseWeight copyWith({
    int? id,
    String? title,
    String? note,
    ExerciseWeightCategory? category,
    String? kg,
    String? date,
  }) {
    return ExerciseWeight(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      category: category ?? this.category,
      kg: kg ?? this.kg,
      date: date ?? this.date,
    );
  }
}
