import 'package:hive/hive.dart';
import 'package:receipe_finder_and_meal_planner/core/constants/hive_constants.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/data/meal_for_the_day_model.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/data/meal_planner_repo_impl.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/domain/meal_planner_repository.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/presentation/bloc/meal_planner_bloc.dart';

import '../../features/home/tabs/meal_planner/domain/meal_planner_use_case.dart';
import 'di.dart';

void mealPlannerDI() {
  sl.registerSingleton<MealPlannerRepository>(
    MealPlannerRepositoryImpl(
      Hive.box<MealForTheDayModel>(HiveConstants.mealPlannerBox),
    ),
  );
  sl.registerSingleton<MealPlannerUseCase>((MealPlannerUseCase(sl())));
  sl.registerFactory<MealPlannerBloc>(() => MealPlannerBloc(useCase: sl()));
}
