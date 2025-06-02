import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/core/_widgets/background_widget.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/extensions.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/flutter_super_scaffold.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/favorites/presentation/widget/favourite_recipes_widget.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/presentation/_widgets/meal_planner_widget.dart';
import 'package:receipe_finder_and_meal_planner/features/network_status/presentation/network_widget.dart';

import '../../tabs/recipe_search/presentation/_widgets/recipe_search_widget.dart';
import '../_widgets/w_navigation_bar.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    RecipeSearchWidget(),
    FavouriteRecipesWidget(),
    MealPlannerWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return FlutterSuperScaffold(
      isTopSafe: false,
      body: Stack(
        children: [
          BackgroundWidget(),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Column(
                children: [
                  MediaQuery.of(context).padding.top.toInt().heightBox(),
                  Expanded(child: _screens[state.currentTabIndex]),
                  NetworkWidget(),
                  CustomNavigationBar(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
