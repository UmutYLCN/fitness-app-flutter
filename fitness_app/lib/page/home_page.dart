import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_app/config/config.dart';
import 'package:fitness_app/data/data.dart';
import 'package:fitness_app/providers/providers.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  static HomePage builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomePage();
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final date = ref.watch(dateProvider);
    final ExerciseState = ref.watch(exercisesProvider);
    final inCompletedExercises =
        _incompltedExercise(ExerciseState.Exercises, ref);
    final completedExercises = _compltedExercise(ExerciseState.Exercises, ref);

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
                    onTap: () => Helpers.selectDate(context, ref),
                    child: DisplayWhiteText(
                      text: Helpers.dateFormatter(date),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const DisplayWhiteText(text: 'My Todo List', size: 40),
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
                    const Gap(20),
                    Text(
                      'Completed',
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(20),
                    DisplayListOfTasks(
                      isCompletedExercises: true,
                      exercises: completedExercises,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () =>
                          context.push(RouteLocation.createExercise),
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
}
