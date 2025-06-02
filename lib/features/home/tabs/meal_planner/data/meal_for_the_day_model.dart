import 'package:hive/hive.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/domain/meal_for_day_entity.dart';

import '../../../../../core/constants/hive_constants.dart';
import '../../recipe_search/data/recipe_detail_model.dart';

part 'meal_for_the_day_model.g.dart';

@HiveType(typeId: HiveConstants.mealForTheDayTypeId)
class MealForTheDayModel {
  @HiveField(0)
  final String day;

  @HiveField(1)
  final RecipeDetailModel? meal;
  MealForTheDayModel({required this.meal, required this.day});

  MealForTheDayEntity toEntity() =>
      MealForTheDayEntity(meal: meal?.toEntity(), day: day);
}
