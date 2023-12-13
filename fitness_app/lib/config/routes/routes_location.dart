import 'package:flutter/foundation.dart' show immutable;

@immutable
class RouteLocation {
  const RouteLocation._();

  static String get home => '/home';
  static String get createExercise => '/createExercise';
  static String get exerciseWeight => '/exerciseWeight';
  static String get createExerciseWight => '/createExerciseWeight';
}
