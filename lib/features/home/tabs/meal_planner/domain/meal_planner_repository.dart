import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/domain/meal_planner_entity.dart';

import '../domain/meal_for_day_entity.dart';

abstract class MealPlannerRepository {
  Future<void> saveMealPlan({
    required String id,
    required MealForTheDayEntity meal,
  });

  Future<MealPlannerEntity> getMealPlanner();

  Future<void> deleteMeal(String id);
}
