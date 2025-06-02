import 'package:equatable/equatable.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/domain/recipe_detail_entity.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/domain/search_receipe_entity.dart';

class RecipeState extends Equatable {
  final List<SearchRecipeEntity> searchResults;
  final bool isSearching;
  final String errorMessage;
  final bool gettingDetail;
  final RecipeDetailEntity? detailRecipe;

  const RecipeState({
    this.searchResults = const [],
    this.isSearching = false,
    this.errorMessage = "",
    this.detailRecipe,
    this.gettingDetail = false,
  });

  factory RecipeState.initial() => RecipeState();

  RecipeState copyWith({
    List<SearchRecipeEntity>? searchResults,
    bool? isSearching,
    String? errorMessage,
    RecipeDetailEntity? detailRecipe,
    bool? gettingDetail,

    bool clearDetailRecipe = false,
  }) => RecipeState(
    searchResults: searchResults ?? this.searchResults,
    isSearching: isSearching ?? this.isSearching,
    errorMessage: errorMessage ?? this.errorMessage,
    detailRecipe:
        clearDetailRecipe ? null : (detailRecipe ?? this.detailRecipe),
    gettingDetail: gettingDetail ?? this.gettingDetail,
  );

  @override
  List<Object?> get props => [
    searchResults,
    isSearching,
    errorMessage,
    detailRecipe,
    gettingDetail,
  ];
}
