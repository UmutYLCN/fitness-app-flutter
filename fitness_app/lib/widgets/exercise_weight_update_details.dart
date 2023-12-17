import 'package:fitness_app/config/config.dart';
import 'package:fitness_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/data/data.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/circle_container.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ExerciseWeightUpdateDetails extends StatelessWidget {
  const ExerciseWeightUpdateDetails(
      {super.key, required this.exerciseWeight, this.onCompleted});

  final ExerciseWeight exerciseWeight;
  final Function(bool?)? onCompleted;
  @override
  Widget build(
    BuildContext context,
  ) {
    final style = context.textTheme;
    final TextEditingController _kgController = TextEditingController();

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
          const Gap(16),
          CommonTextField(
              controller: _kgController,
              hintText: '0',
              title: 'New Update Value'),
          const Gap(20),
          ElevatedButton(
            onPressed: () async => {
              if (_kgController.text.trim().isNotEmpty)
                {
                  ExerciseWeightDatasource()
                      .updateKg(exerciseWeight, _kgController.text.trim())
                      .then((value) => {
                            AppAlerts.displaySnackbar(
                                context, 'Exercise kg update successfully'),
                            context.pop(),
                            context.push(RouteLocation.exerciseWeight)
                          })
                }
              else
                {AppAlerts.displaySnackbar(context, 'Title cannot be empty')}
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: DisplayWhiteText(
                text: 'Update',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
