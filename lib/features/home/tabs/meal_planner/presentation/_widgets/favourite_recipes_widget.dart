import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/extensions.dart';

import '../../../../../../core/_widgets/cached_network_image.dart';
import '../../../../../../core/_widgets/custom_grid.dart';
import '../../../favorites/presentation/bloc/favourite_bloc.dart';
import '../../../favorites/presentation/bloc/favourite_state.dart';
import '../../domain/meal_for_day_entity.dart';
import '../bloc/meal_planner_bloc.dart';
import '../bloc/meal_planner_event.dart';

class FavouriteRecipesBottomSheet extends StatelessWidget {
  const FavouriteRecipesBottomSheet({
    super.key,
    required this.id,
    required this.type,
  });
  final String id;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder:
            (context, state) =>
                state.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                      children: [
                        Text(
                          "What's on your mind??",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        20.heightBox(),
                        Expanded(
                          child: CustomGrid(
                            maxCrossAxisExtent: 150,
                            items: state.favourites,
                            itemBuilder:
                                (recipeDetail) => GestureDetector(
                                  onTap: () {
                                    context.read<MealPlannerBloc>().add(
                                      AddMealPlannerEvent(
                                        id: id,
                                        meal: MealForTheDayEntity(
                                          meal: recipeDetail,
                                          day: type,
                                        ),
                                      ),
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: CachedImage(
                                          imageUrl: recipeDetail.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          recipeDetail.title,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          ),
                        ),
                      ],
                    ),
      ),
    );
  }
}
