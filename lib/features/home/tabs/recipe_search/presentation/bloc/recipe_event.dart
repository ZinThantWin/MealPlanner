import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/domain/recipe_detail_entity.dart';

abstract class RecipeEvent {}

final class RecipeSearchEvent extends RecipeEvent {
  final String query;
  RecipeSearchEvent(this.query);
}

final class FetchRecipeDetailEvent extends RecipeEvent {
  final int id;
  FetchRecipeDetailEvent(this.id);
}

final class SetRecipeDetailEvent extends RecipeEvent {
  final RecipeDetailEntity detail;
  SetRecipeDetailEvent(this.detail);
}
