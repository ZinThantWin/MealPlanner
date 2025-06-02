import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/core/_widgets/custom_grid.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/favorites/presentation/bloc/favourite_bloc.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/favorites/presentation/bloc/favourite_event.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/favorites/presentation/bloc/favourite_state.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/domain/search_receipe_entity.dart';

import '../../../recipe_search/presentation/_widgets/each_recipe.dart';

class FavouriteRecipesWidget extends StatefulWidget {
  const FavouriteRecipesWidget({super.key});

  @override
  State<FavouriteRecipesWidget> createState() => _FavouriteRecipesWidgetState();
}

class _FavouriteRecipesWidgetState extends State<FavouriteRecipesWidget> {
  @override
  void initState() {
    _refreshFavourites();
    super.initState();
  }

  void _refreshFavourites() {
    context.read<FavouriteBloc>().add(LoadFavouritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder:
          (context, state) =>
              state.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                    child: CustomGrid(
                      items: state.favourites,
                      itemBuilder:
                          (recipeDetail) => RecipeWidget(
                            recipeDetail: recipeDetail,
                            recipe: SearchRecipeEntity(
                              title: recipeDetail.title,
                              id: recipeDetail.id,
                              image: recipeDetail.image,
                            ),
                          ),
                    ),
                  ),
    );
  }
}
