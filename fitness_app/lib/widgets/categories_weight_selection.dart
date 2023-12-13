import 'package:fitness_app/providers/category_weight_provider.dart';
import 'package:fitness_app/utils/exerciseWeight_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/widgets.dart';
import 'package:gap/gap.dart';

class CategoriesWeightSelection extends ConsumerWidget {
  const CategoriesWeightSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryWeightProvider);
    final List<ExerciseWeightCategory> categories =
        ExerciseWeightCategory.values.toList();

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            'Category',
            style: context.textTheme.titleLarge,
          ),
          const Gap(10),
          Expanded(
            child: ListView.separated(
              itemCount: categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                final category = categories[index];

                return InkWell(
                  onTap: () {
                    ref.read(categoryWeightProvider.notifier).state = category;
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: CircleContainer(
                    color: category.color.withOpacity(0.3),
                    borderColor: category.color,
                    child: Icon(
                      category.icon,
                      color: selectedCategory == category
                          ? context.colorScheme.primary
                          : category.color.withOpacity(0.5),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Gap(8),
            ),
          ),
        ],
      ),
    );
  }
}
