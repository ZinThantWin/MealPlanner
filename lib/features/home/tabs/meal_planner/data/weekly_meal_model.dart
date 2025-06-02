import 'package:hive/hive.dart';

import '../../../../../core/constants/hive_constants.dart';
import '../domain/meal_for_day_entity.dart';
import '../domain/weekly_meal_entity.dart';

part 'weekly_meal_model.g.dart';

@HiveType(typeId: HiveConstants.weeklyMealTypeId)
class WeeklyMealModel {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final List<MealForTheDayEntity> meals;

  WeeklyMealModel({required this.meals, required this.date});

  WeeklyMealEntity toEntity() => WeeklyMealEntity(date: date, meals: meals);

  static WeeklyMealModel fromEntity(WeeklyMealEntity entity) =>
      WeeklyMealModel(date: entity.date, meals: entity.meals);
}
