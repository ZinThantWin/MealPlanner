import 'package:hive/hive.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/data/weekly_meal_model.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/domain/meal_planner_entity.dart';

import '../../../../../core/constants/hive_constants.dart';

part 'meal_planner_model.g.dart';

@HiveType(typeId: HiveConstants.mealPlannerId)
class MealPlannerModel extends HiveObject {
  @HiveField(0)
  List<WeeklyMealModel> mealPlanner;

  MealPlannerModel({required this.mealPlanner});

  MealPlannerEntity toEntity() => MealPlannerEntity(
    mealPlanner: mealPlanner.map((e) => e.toEntity()).toList(),
  );
}
