import '../../recipe_search/domain/recipe_detail_entity.dart';

abstract class FavouriteRepository {
  Future<void> addToFavourites(RecipeDetailEntity recipe);
  Future<void> removeFromFavourites(int id);
  Future<List<RecipeDetailEntity>> getFavouriteRecipes();
  bool isFavourite(int id);
}
