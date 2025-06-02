import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/core/constants/app_colors.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/favorites/presentation/bloc/favourite_bloc.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/favorites/presentation/bloc/favourite_event.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/favorites/presentation/bloc/favourite_state.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/domain/recipe_detail_entity.dart';

class FavouriteIconButton extends StatelessWidget {
  final RecipeDetailEntity recipe;

  const FavouriteIconButton({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        final isFavourite = state.favourites.any((e) => e.id == recipe.id);
        return IconButton(
          icon: Icon(
            isFavourite ? Icons.favorite : Icons.favorite_border,
            color: isFavourite ? AppColors.red : AppColors.gray,
          ),
          onPressed: () {
            final bloc = context.read<FavouriteBloc>();
            if (isFavourite) {
              bloc.add(RemoveFromFavouritesEvent(recipe.id));
            } else {
              bloc.add(AddToFavouritesEvent(recipe));
            }
          },
        );
      },
    );
  }
}
