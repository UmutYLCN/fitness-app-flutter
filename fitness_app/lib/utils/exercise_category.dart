import 'package:flutter/material.dart';

enum ExerciseCategory {
  education(Icons.school, Colors.blueGrey),
  health(Icons.favorite, Colors.orange),
  home(Icons.home, Colors.green),
  others(Icons.calendar_month_rounded, Colors.purple),
  personal(Icons.person, Colors.lightBlue),
  shopping(Icons.shopping_bag, Colors.deepOrange),
  social(Icons.people, Colors.brown),
  travel(Icons.flight, Colors.pink),
  work(Icons.work, Colors.amber);

  static ExerciseCategory stringToExerciseCategory(String name) {
    try {
      return ExerciseCategory.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return ExerciseCategory.others;
    }
  }

  final IconData icon;
  final Color color;
  const ExerciseCategory(this.icon, this.color);
}
