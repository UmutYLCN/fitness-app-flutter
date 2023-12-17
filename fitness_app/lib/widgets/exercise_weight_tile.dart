import 'package:fitness_app/widgets/exercise_weight_update_details.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/data/data.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/widgets.dart';

import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExerciseWeightTile extends StatelessWidget {
  const ExerciseWeightTile({
    super.key,
    required this.exercise,
    this.onCompleted,
  });

  final ExerciseWeight exercise;

  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    //final colors = context.colorScheme;

    const textDecoration = TextDecoration.none;
    const fontWeight = FontWeight.bold;
    const double iconOpacity = 0.5;
    const double backgroundOpacity = 0.3;

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
                '${exercise.kg} Kg',
                style: style.titleMedium?.copyWith(
                  decoration: textDecoration,
                ),
              ),
            ],
          )),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.ellipsisVertical),
            onPressed: () async {
              await showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return ExerciseWeightUpdateDetails(
                    exerciseWeight: exercise,
                    onCompleted: onCompleted,
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
