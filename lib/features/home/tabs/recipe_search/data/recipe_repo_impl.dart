import 'package:receipe_finder_and_meal_planner/core/constants/api_endpoints.dart';
import 'package:receipe_finder_and_meal_planner/core/services/api_service.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/super_print.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/data/recipe_detail_model.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/data/search_recipe_model.dart';

import '../../../../../core/di/di.dart';
import '../domain/recipe_repository.dart';

final class RecipeRepositoryImplementation extends RecipeRepository {
  @override
  Future<List<SearchRecipeModel>> searchRecipeOnGradients({
    required String query,
  }) async {
    final apiService = sl<ApiService>();
    List<SearchRecipeModel> searchResults = [];
    await apiService.get(
      endpoint: ApiEndpoints.searchRecipeByIngredients,
      params: {"ingredients": query},
      onSuccess: (res) {
        for (Map<String, dynamic> r in res['res']) {
          searchResults.add(SearchRecipeModel.fromJson(json: r));
        }
      },
      onFailure: (err) {
        superPrint(err);
      },
    );
    return searchResults;
  }

  @override
  Future<RecipeDetailModel?> getRecipeDetail({required int id}) async {
    RecipeDetailModel? detail;
    await sl<ApiService>().get(
      endpoint: ApiEndpoints.searchRecipeById(id),
      params: {},
      onSuccess: (res) {
        detail = RecipeDetailModel.fromJson(res["res"]);
      },
      onFailure: (err) {
        superPrint(err);
      },
    );
    return detail;
  }
}
