import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/domain/meal_for_day_entity.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/domain/weekly_meal_entity.dart';

abstract class MealPlannerEvent {}

final class AddMealPlannerEvent extends MealPlannerEvent {
  final MealForTheDayEntity meal;
  final String id;
  AddMealPlannerEvent({required this.id, required this.meal});
}

final class GetMealPlannerEvent extends MealPlannerEvent {}

final class SelectMealPlannerEvent extends MealPlannerEvent {
  final WeeklyMealEntity selectedDay;

  SelectMealPlannerEvent(this.selectedDay);
}

final class DeleteMealPlannerEvent extends MealPlannerEvent {
  final String key;

  DeleteMealPlannerEvent(this.key);
}
