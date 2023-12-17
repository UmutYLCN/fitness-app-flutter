import 'package:fitness_app/providers/exercise/exercise_weight_provider.dart';
import 'package:fitness_app/widgets/exercise_weight_details.dart';
import 'package:fitness_app/widgets/exercise_weight_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_app/data/data.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/widgets.dart';

class DisplayListOfExercise extends ConsumerWidget {
  const DisplayListOfExercise({
    super.key,
    required this.exercises,
    required bool isCompletedExercises,
  });
  final List<ExerciseWeight> exercises;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height = deviceSize.height * 0.65;
    const emptyTasksAlert = 'There is no added exercise!';

    return CommonContainer(
      height: height,
      child: exercises.isEmpty
          ? Center(
              child: Text(
                emptyTasksAlert,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: exercises.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final ex = exercises[index];

                return InkWell(
                  onLongPress: () async {
                    await AppAlerts.showAlertDeleteWeightDialog(
                      context: context,
                      ref: ref,
                      exercise: ex,
                    );
                  },
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return ExerciseWeightDetails(exerciseWeight: ex);
                      },
                    );
                  },
                  child: ExerciseWeightTile(
                    exercise: ex,
                    onCompleted: (value) async {
                      await ref
                          .read(exercisesWeightProvider.notifier)
                          .updateExercise(ex);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 1.5,
              ),
            ),
    );
  }
}
