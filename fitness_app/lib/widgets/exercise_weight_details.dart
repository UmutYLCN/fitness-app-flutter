import 'package:flutter/material.dart';
import 'package:fitness_app/data/data.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/circle_container.dart';
import 'package:gap/gap.dart';

class ExerciseWeightDetails extends StatelessWidget {
  const ExerciseWeightDetails({super.key, required this.exerciseWeight});

  final ExerciseWeight exerciseWeight;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleContainer(
            color: exerciseWeight.category.color.withOpacity(0.3),
            child: Icon(
              exerciseWeight.category.icon,
              color: exerciseWeight.category.color,
            ),
          ),
          const Gap(16),
          Text(
            exerciseWeight.title,
            style: style.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Text(
            '${exerciseWeight.kg} Kg',
            style: style.titleMedium
                ?.copyWith(fontWeight: FontWeight.normal, fontSize: 25),
          ),
          const Gap(16),
          Divider(
            color: exerciseWeight.category.color,
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
