import 'package:fitness_app/data/models/exerciseWeight.dart';
import 'package:fitness_app/providers/exercise/exercise_weight_provider.dart';
import 'package:fitness_app/widgets/display_list_of_exercises.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_app/config/config.dart';
import 'package:fitness_app/data/data.dart';
import 'package:fitness_app/providers/providers.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ExerciseWeightPage extends ConsumerWidget {
  static ExerciseWeightPage builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const ExerciseWeightPage();
  const ExerciseWeightPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final date = ref.watch(dateProvider);
    final exerciseWeightState = ref.watch(exercisesWeightProvider);
    final inExerciseList =
        _exercisesWeightList(exerciseWeightState.exercises, ref);

    return Scaffold(
      body: Stack(
        children: [
          AppBackground(
            headerHeight: deviceSize.height * 0.3,
            header: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => null,
                    child: DisplayWhiteText(
                      text: Helpers.dateFormatter(date),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const DisplayWhiteText(
                      text: 'Exercise Weight List', size: 40),
                ],
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfExercise(
                      exercises: inExerciseList,
                      isCompletedExercises: false,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () =>
                          context.push(RouteLocation.createExerciseWight),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWhiteText(
                          text: 'Add New Exercise',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Exercise> _incompltedExercise(List<Exercise> Exercises, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Exercise> filteredExercise = [];

    for (var Exercise in Exercises) {
      if (!Exercise.isCompleted) {
        final isExerciseDay =
            Helpers.isExerciseFromSelectedDate(Exercise, date);
        if (isExerciseDay) {
          filteredExercise.add(Exercise);
        }
      }
    }
    return filteredExercise;
  }

  List<Exercise> _compltedExercise(List<Exercise> Exercises, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Exercise> filteredExercise = [];

    for (var exercise in Exercises) {
      if (exercise.isCompleted) {
        final isExerciseDay =
            Helpers.isExerciseFromSelectedDate(exercise, date);
        if (isExerciseDay) {
          filteredExercise.add(exercise);
        }
      }
    }
    return filteredExercise;
  }

  List<ExerciseWeight> _exercisesWeightList(
      List<ExerciseWeight> exerciseWeight, WidgetRef ref) {
    final List<ExerciseWeight> filteredExerciseWeight = [];

    for (var exercise in exerciseWeight) {
      filteredExerciseWeight.add(exercise);
    }
    return filteredExerciseWeight;
  }
}
