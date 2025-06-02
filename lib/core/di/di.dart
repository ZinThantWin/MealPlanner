import 'package:get_it/get_it.dart';
import 'package:receipe_finder_and_meal_planner/core/di/hive_di.dart';
import 'package:receipe_finder_and_meal_planner/core/di/meal_planner_di.dart';
import 'package:receipe_finder_and_meal_planner/core/di/network_di.dart';
import 'package:receipe_finder_and_meal_planner/core/di/search_recipe_di.dart';

import '../services/api_service.dart';
import 'favourite_di.dart';
import 'home_di.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  /// core dependencies
  await initializeHive();
  sl.registerLazySingleton<ApiService>(() => ApiService());
  networkDI();

  /// Features
  searchRecipeDI();
  favouriteRecipeDI();
  mealPlannerDI();
  homeDI();
}
