import '../domain/meal_for_day_entity.dart';

class WeeklyMealEntity {
  final DateTime date;
  final List<MealForTheDayEntity> meals;

  WeeklyMealEntity({required this.meals, required this.date});

  @override
  String toString() {
    return 'WeeklyMealEntity{date: $date, meals: $meals}';
  }
}
