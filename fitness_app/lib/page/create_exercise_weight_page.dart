import 'package:fitness_app/providers/category_weight_provider.dart';
import 'package:fitness_app/providers/exercise/exercise_weight_provider.dart';
import 'package:fitness_app/widgets/categories_weight_selection.dart';
import 'package:fitness_app/widgets/select_date_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_app/config/config.dart';
import 'package:fitness_app/data/data.dart';
import 'package:fitness_app/providers/providers.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CreateExerciseWeightPage extends ConsumerStatefulWidget {
  static CreateExerciseWeightPage builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateExerciseWeightPage();
  const CreateExerciseWeightPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateExerciseWeightPageState();
}

class _CreateExerciseWeightPageState
    extends ConsumerState<CreateExerciseWeightPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _kgController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    _kgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: const DisplayWhiteText(
          text: 'Add New Task',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                hintText: 'Dumbell Curl',
                title: 'Exercise Title',
                controller: _titleController,
              ),
              const Gap(30),
              const CategoriesWeightSelection(),
              const Gap(30),
              SelectDateWeight(controller: _kgController),
              const Gap(30),
              CommonTextField(
                hintText: 'Notes',
                title: 'Notes',
                maxLines: 6,
                controller: _noteController,
              ),
              const Gap(30),
              ElevatedButton(
                onPressed: _createTask,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DisplayWhiteText(
                    text: 'Save',
                  ),
                ),
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final kg = _kgController.text.trim();
    final date = ref.watch(dateProvider);
    final category = ref.watch(categoryWeightProvider);
    if (title.isNotEmpty) {
      final task = ExerciseWeight(
        title: title,
        category: category,
        kg: kg,
        date: DateFormat.yMMMd().format(date),
        note: note,
      );

      await ref
          .read(exercisesWeightProvider.notifier)
          .createExercise(task)
          .then((value) {
        AppAlerts.displaySnackbar(context, 'Task create successfully');
        context.go(RouteLocation.exerciseWeight);
      });
    } else {
      AppAlerts.displaySnackbar(context, 'Title cannot be empty');
    }
  }
}
