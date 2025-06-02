import 'package:hive_flutter/hive_flutter.dart';

import '../../features/home/tabs/meal_planner/data/meal_for_the_day_model.dart';
import '../../features/home/tabs/meal_planner/data/meal_planner_model.dart';
import '../../features/home/tabs/meal_planner/data/weekly_meal_model.dart';
import '../../features/home/tabs/recipe_search/data/recipe_detail_model.dart';
import '../constants/hive_constants.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeDetailModelAdapter());
  Hive.registerAdapter(MealPlannerModelAdapter());
  Hive.registerAdapter(WeeklyMealModelAdapter());
  Hive.registerAdapter(MealForTheDayModelAdapter());
  await Hive.openBox<RecipeDetailModel>(HiveConstants.favouriteBox);
  await Hive.openBox<MealForTheDayModel>(HiveConstants.mealPlannerBox);
  await Hive.openBox(HiveConstants.cachedResponseBox);
}
