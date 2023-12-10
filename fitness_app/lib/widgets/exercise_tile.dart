import 'package:flutter/material.dart';
import 'package:fitness_app/data/data.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/widgets.dart';
import 'package:gap/gap.dart';

class ExerciseTile extends StatelessWidget {
  const ExerciseTile({
    super.key,
    required this.exercise,
    this.onCompleted,
  });

  final Exercise exercise;

  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    final colors = context.colorScheme;

    final textDecoration =
        exercise.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight =
        exercise.isCompleted ? FontWeight.normal : FontWeight.bold;
    final double iconOpacity = exercise.isCompleted ? 0.3 : 0.5;
    final double backgroundOpacity = exercise.isCompleted ? 0.1 : 0.3;

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          CircleContainer(
            borderColor: exercise.category.color,
            color: exercise.category.color.withOpacity(backgroundOpacity),
            child: Icon(
              exercise.category.icon,
              color: exercise.category.color.withOpacity(iconOpacity),
            ),
          ),
          const Gap(16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exercise.title,
                style: style.titleMedium?.copyWith(
                  fontWeight: fontWeight,
                  fontSize: 20,
                  decoration: textDecoration,
                ),
              ),
              Text(
                exercise.time,
                style: style.titleMedium?.copyWith(
                  decoration: textDecoration,
                ),
              ),
            ],
          )),
          Checkbox(
            value: exercise.isCompleted,
            onChanged: onCompleted,
            checkColor: colors.surface,
            // fillColor: MaterialStateProperty.resolveWith<Color>(
            //   (Set<MaterialState> states) {
            //     if (states.contains(MaterialState.disabled)) {
            //       return colors.primary;
            //     }
            //     return colors.primary;
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}
