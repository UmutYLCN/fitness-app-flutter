import 'package:fitness_app/config/routes/routes_location.dart';
import 'package:fitness_app/config/routes/routes_provider.dart';
import 'package:fitness_app/page/create_exercise_page.dart';
import 'package:fitness_app/page/page.dart';
import 'package:go_router/go_router.dart';

final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomePage.builder,
  ),
  GoRoute(
    path: RouteLocation.createExercise,
    parentNavigatorKey: navigationKey,
    builder: CreateExercisePage.builder,
  ),
];
