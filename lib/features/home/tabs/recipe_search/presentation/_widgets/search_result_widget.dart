import 'package:flutter/material.dart';
import 'package:receipe_finder_and_meal_planner/core/_widgets/custom_grid.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/domain/search_receipe_entity.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/presentation/_widgets/each_recipe.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, required this.result});
  final List<SearchRecipeEntity> result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: CustomGrid(
        items: result,
        emptyText: "No Items!",
        itemBuilder: (recipe) => RecipeWidget(recipe: recipe),
      ),
    );
  }
}
