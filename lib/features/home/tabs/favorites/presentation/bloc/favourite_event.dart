import '../../../recipe_search/domain/recipe_detail_entity.dart';

abstract class FavouriteEvent {}

final class LoadFavouritesEvent extends FavouriteEvent {}

final class AddToFavouritesEvent extends FavouriteEvent {
  final RecipeDetailEntity recipe;
  AddToFavouritesEvent(this.recipe);
}

final class RemoveFromFavouritesEvent extends FavouriteEvent {
  final int recipeId;
  RemoveFromFavouritesEvent(this.recipeId);
}
