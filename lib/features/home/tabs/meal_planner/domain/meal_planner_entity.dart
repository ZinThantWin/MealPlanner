import 'package:hive/hive.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/domain/weekly_meal_entity.dart';

class MealPlannerEntity extends HiveObject {
  List<WeeklyMealEntity> mealPlanner;

  MealPlannerEntity({required this.mealPlanner});
}
