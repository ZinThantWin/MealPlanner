import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/extensions.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/helper.dart';

import '../../../../../../core/_widgets/cached_network_image.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/super_print.dart';
import '../../../favorites/presentation/bloc/favourite_bloc.dart';
import '../../../recipe_search/domain/recipe_detail_entity.dart';
import '../../../recipe_search/presentation/_widgets/recipe_detail_widget.dart';
import '../../../recipe_search/presentation/bloc/recipe_bloc.dart';
import '../../domain/meal_for_day_entity.dart';
import '../../domain/weekly_meal_entity.dart';
import '../bloc/meal_planner_bloc.dart';
import '../bloc/meal_planner_event.dart';
import 'favourite_recipes_widget.dart';

class EachDayWidget extends StatelessWidget {
  const EachDayWidget({super.key, this.day});
  final WeeklyMealEntity? day;

  @override
  Widget build(BuildContext context) {
    return day == null
        ? SizedBox.shrink()
        : Column(
          children:
              day!.meals
                  .map(
                    (e) => _eachCard(context, e, day!.date.toIso8601String()),
                  )
                  .toList(),
        );
  }

  Widget _eachCard(
    BuildContext context,
    MealForTheDayEntity each,
    String date,
  ) {
    bool emptyMeal = each.meal == null;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          builder:
              (BuildContext ctx) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.read<FavouriteBloc>()),
                  BlocProvider.value(value: context.read<MealPlannerBloc>()),
                ],
                child: FavouriteRecipesBottomSheet(
                  id: AppHelper.normalizeDateKey(date, each.day),
                  type: each.day,
                ),
              ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withAlpha(opacityToAlpha(0.15)),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              each.day.toString().capitalizeFirst(),
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            10.heightBox(),
            emptyMeal
                ? _emptyMealView()
                : _mealView(context, each.meal!, () {
                  context.read<MealPlannerBloc>().add(
                    DeleteMealPlannerEvent(
                      AppHelper.normalizeDateKey(date, each.day),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Row _emptyMealView() => Row(
    children: [
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary),
        ),
        child: Icon(Icons.add),
      ),
      20.widthBox(),
      Text("What would you like for today?"),
    ],
  );

  Row _mealView(
    BuildContext context,
    RecipeDetailEntity meal,
    Function onDelete,
  ) => Row(
    children: [
      GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => MultiBlocProvider(
                      providers: [
                        BlocProvider.value(value: context.read<RecipeBloc>()),
                        BlocProvider.value(
                          value: context.read<FavouriteBloc>(),
                        ),
                      ],
                      child: RecipeDetailWidget(
                        id: meal.id,
                        imageUrl: meal.image,
                        recipeDetail: meal,
                      ),
                    ),
              ),
            ),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(shape: BoxShape.circle),
          clipBehavior: Clip.antiAlias,
          child: CachedImage(imageUrl: meal.image, fit: BoxFit.cover),
        ),
      ),
      20.widthBox(),
      Expanded(child: Text(meal.title)),
      5.widthBox(),
      GestureDetector(
        onTap: () {
          onDelete();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text("Remove", style: TextStyle(color: Colors.white)),
        ),
      ),
    ],
  );
}
