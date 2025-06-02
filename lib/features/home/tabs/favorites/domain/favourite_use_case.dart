import '../../recipe_search/domain/recipe_detail_entity.dart';
import 'favourite_repository.dart';

class FavouriteUseCase {
  final FavouriteRepository repository;

  FavouriteUseCase(this.repository);

  Future<void> add(RecipeDetailEntity recipe) =>
      repository.addToFavourites(recipe);

  Future<void> remove(int id) => repository.removeFromFavourites(id);

  Future<List<RecipeDetailEntity>> getAll() => repository.getFavouriteRecipes();

  bool isFavourite(int id) => repository.isFavourite(id);
}
