import '../../recipe_search/domain/recipe_detail_entity.dart';

class MealForTheDayEntity {
  final String day;
  final RecipeDetailEntity? meal;

  MealForTheDayEntity({required this.meal, required this.day});

  @override
  String toString() {
    return 'MealForTheDayEntity{day: $day, meal: $meal}';
  }
}
