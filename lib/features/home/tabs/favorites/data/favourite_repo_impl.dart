import 'package:hive/hive.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/data/recipe_detail_model.dart';

import '../../recipe_search/domain/recipe_detail_entity.dart';
import '../domain/favourite_repository.dart';

class FavouriteRepositoryImplementation extends FavouriteRepository {
  final Box<RecipeDetailModel> box;

  FavouriteRepositoryImplementation(this.box);

  @override
  Future<void> addToFavourites(RecipeDetailEntity recipe) async {
    final model = RecipeDetailModel(
      id: recipe.id,
      title: recipe.title,
      image: recipe.image,
      readyInMinutes: recipe.readyInMinutes,
      servings: recipe.servings,
      sourceUrl: recipe.sourceUrl,
      ingredients: recipe.ingredients,
      instructions: recipe.instructions,
      isFavourite: true,
    );
    await box.put(model.id, model);
  }

  @override
  Future<void> removeFromFavourites(int id) async {
    await box.delete(id);
  }

  @override
  Future<List<RecipeDetailEntity>> getFavouriteRecipes() async {
    return box.values.map((model) => model.toEntity()).toList();
  }

  @override
  bool isFavourite(int id) {
    return box.containsKey(id);
  }
}
