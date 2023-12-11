import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_app/data/data.dart';
import 'package:fitness_app/providers/providers.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/widgets.dart';

class DisplayListOfTasks extends ConsumerWidget {
  const DisplayListOfTasks({
    super.key,
    this.isCompletedTasks = false,
    required this.exercises,
    required bool isCompletedExercises,
  });
  final bool isCompletedTasks;
  final List<Exercise> exercises;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksAlert = isCompletedTasks
        ? 'There is no completed task yet'
        : 'There is no task to todo!';

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
                    await AppAlerts.showAlertDeleteDialog(
                      context: context,
                      ref: ref,
                      exercise: ex,
                    );
                  },
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return ExerciseDetails(task: ex);
                      },
                    );
                  },
                  child: ExerciseTile(
                    exercise: ex,
                    onCompleted: (value) async {
                      await ref
                          .read(exercisesProvider.notifier)
                          .updateExercise(ex)
                          .then((value) {
                        AppAlerts.displaySnackbar(
                          context,
                          ex.isCompleted
                              ? 'Exercise incompleted'
                              : 'Exercise completed',
                        );
                      });
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
