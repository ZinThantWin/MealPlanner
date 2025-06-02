import 'package:flutter/material.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/extensions.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/helper.dart';
import '../../../../../../core/utils/super_print.dart';
import '../../domain/weekly_meal_entity.dart';

class MealDayChip extends StatelessWidget {
  const MealDayChip({
    super.key,
    required this.each,
    required this.isSelected,
    required this.onTap,
  });
  final WeeklyMealEntity each;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: isSelected ? Border.all(color: AppColors.primary) : Border(),
          color:
              isSelected
                  ? AppColors.primary.withAlpha(opacityToAlpha(0.4))
                  : AppColors.gray.withAlpha(opacityToAlpha(0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppHelper.formatDate(each.date).toUpperCase(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
            5.heightBox(),
            Text(
              each.date.day.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            5.heightBox(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  width: 2,
                  color: isSelected ? AppColors.primary : AppColors.gray,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
