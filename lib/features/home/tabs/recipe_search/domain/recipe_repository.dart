import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/data/recipe_detail_model.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/data/search_recipe_model.dart';

abstract class RecipeRepository {
  Future<List<SearchRecipeModel>> searchRecipeOnGradients({
    required String query,
  });

  Future<RecipeDetailModel?> getRecipeDetail({required int id});
}
