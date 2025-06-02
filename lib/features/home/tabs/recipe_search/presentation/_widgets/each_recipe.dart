import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/core/_widgets/cached_network_image.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/domain/search_receipe_entity.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/presentation/_widgets/recipe_detail_widget.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/presentation/bloc/recipe_bloc.dart';

import '../../../favorites/presentation/bloc/favourite_bloc.dart';
import '../../domain/recipe_detail_entity.dart';

class RecipeWidget extends StatelessWidget {
  const RecipeWidget({super.key, required this.recipe, this.recipeDetail});

  final SearchRecipeEntity recipe;
  final RecipeDetailEntity? recipeDetail;

  /// this is for offline

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(value: context.read<RecipeBloc>()),
                      BlocProvider.value(value: context.read<FavouriteBloc>()),
                    ],
                    child: RecipeDetailWidget(
                      id: recipe.id,
                      imageUrl: recipe.image,
                      recipeDetail: recipeDetail,
                    ),
                  ),
            ),
          ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: recipe.image,
                child: CachedImage(imageUrl: recipe.image, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                recipe.title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
