import 'package:hive/hive.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/data/meal_for_the_day_model.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/domain/meal_planner_entity.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/data/recipe_detail_model.dart';

import '../../../../../core/utils/enums.dart';
import '../domain/meal_for_day_entity.dart';
import '../domain/meal_planner_repository.dart';
import '../domain/weekly_meal_entity.dart';

class MealPlannerRepositoryImpl implements MealPlannerRepository {
  final Box<MealForTheDayModel> box;

  MealPlannerRepositoryImpl(this.box);

  @override
  Future<void> saveMealPlan({
    required String id,
    required MealForTheDayEntity meal,
  }) async {
    final entity = meal.meal;
    if (entity == null) return;
    final model = MealForTheDayModel(
      meal: RecipeDetailModel(
        id: entity.id,
        title: entity.title,
        image: entity.image,
        readyInMinutes: entity.readyInMinutes,
        servings: entity.servings,
        sourceUrl: entity.sourceUrl,
        ingredients: entity.ingredients,
        instructions: entity.instructions,
      ),
      day: meal.day,
    );
    await box.put(id, model);
  }

  @override
  Future<MealPlannerEntity> getMealPlanner() async {
    final now = DateTime.now();

    // get Monday of the current week
    final monday = now.subtract(Duration(days: now.weekday - 1));
    final List<WeeklyMealEntity> weeklyMeals = [];
    final Set<String> validKeys = {};

    // get keys for this week (Monday to Sunday)
    for (int i = 0; i < 7; i++) {
      final date = DateTime(
        monday.year,
        monday.month,
        monday.day,
      ).add(Duration(days: i));
      final dateIso = date.toIso8601String();

      final List<MealForTheDayEntity> mealsForDay = [];

      for (final mealType in EnumMealType.values) {
        final key = "$dateIso${mealType.name}";
        validKeys.add(key);

        final model = box.get(key);
        mealsForDay.add(
          model != null
              ? model.toEntity()
              : MealForTheDayEntity(day: mealType.name, meal: null),
        );
      }

      weeklyMeals.add(WeeklyMealEntity(date: date, meals: mealsForDay));
    }

    final keysToDelete =
        box.keys.where((key) {
          for (final mealType in EnumMealType.values) {
            if (key.toString().endsWith(mealType.name)) {
              final datePart = key.toString().replaceAll(mealType.name, '');
              try {
                final parsedDate = DateTime.parse(datePart);
                final normalizedParsedDate = DateTime(
                  parsedDate.year,
                  parsedDate.month,
                  parsedDate.day,
                );
                final normalizedMonday = DateTime(
                  monday.year,
                  monday.month,
                  monday.day,
                );
                return normalizedParsedDate.isBefore(normalizedMonday);
              } catch (_) {
                return false;
              }
            }
          }
          return false;
        }).toList();

    if (keysToDelete.isNotEmpty) {
      await box.deleteAll(keysToDelete);
    }

    return MealPlannerEntity(mealPlanner: weeklyMeals);
  }

  @override
  Future<void> deleteMeal(String id) async {
    await box.delete(id);
  }
}
