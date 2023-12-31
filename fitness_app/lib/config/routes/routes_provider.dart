import 'package:fitness_app/config/routes/app_routes.dart';
import 'package:fitness_app/config/routes/routes_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final navigationKey = GlobalKey<NavigatorState>();

final routesProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: RouteLocation.exerciseWeight,
      navigatorKey: navigationKey,
      routes: appRoutes,
    );
  },
);
