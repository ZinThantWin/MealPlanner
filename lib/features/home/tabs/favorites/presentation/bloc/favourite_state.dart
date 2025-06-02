import 'package:equatable/equatable.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/domain/recipe_detail_entity.dart';

class FavouriteState extends Equatable {
  final List<RecipeDetailEntity> favourites;
  final bool isLoading;
  final String? error;

  const FavouriteState({
    this.favourites = const [],
    this.isLoading = false,
    this.error,
  });

  factory FavouriteState.initial() => const FavouriteState();

  FavouriteState copyWith({
    List<RecipeDetailEntity>? favourites,
    bool? isLoading,
    String? error,
  }) {
    return FavouriteState(
      favourites: favourites ?? this.favourites,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [favourites, isLoading, error];
}
