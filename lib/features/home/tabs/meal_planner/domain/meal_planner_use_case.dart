import 'meal_for_day_entity.dart';
import 'meal_planner_entity.dart';
import 'meal_planner_repository.dart';

class MealPlannerUseCase {
  final MealPlannerRepository repository;

  MealPlannerUseCase(this.repository);

  Future<void> saveMealPlan({
    required String id,
    required MealForTheDayEntity meal,
  }) async {
    await repository.saveMealPlan(meal: meal, id: id);
  }

  Future<MealPlannerEntity> getMealPlanner() async {
    return await repository.getMealPlanner();
  }

  Future<void> deleteMeal(String id) async {
    return await repository.deleteMeal(id);
  }
}
