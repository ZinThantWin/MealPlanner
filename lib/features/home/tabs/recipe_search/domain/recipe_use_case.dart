import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/domain/recipe_detail_entity.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/domain/recipe_repository.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/domain/search_receipe_entity.dart';

final class RecipeUseCase {
  final RecipeRepository repository;

  RecipeUseCase(this.repository);

  Future<List<SearchRecipeEntity>> search({required String query}) async {
    final models = await repository.searchRecipeOnGradients(query: query);
    return models.map((e) => e.toEntity()).toList();
  }

  Future<RecipeDetailEntity?> getDetail(int id) async {
    final model = await repository.getRecipeDetail(id: id);
    return model?.toEntity();
  }
}
