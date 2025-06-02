import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/favorites/presentation/bloc/favourite_bloc.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/presentation/bloc/meal_planner_bloc.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/presentation/bloc/recipe_bloc.dart';
import 'package:receipe_finder_and_meal_planner/features/network_status/presentation/bloc/network_bloc.dart';
import 'core/di/di.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Finder and Meal Planner',
      theme: ThemeData(
        fontFamily: 'Euclid',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<HomeBloc>()),
          BlocProvider(create: (context) => sl<RecipeBloc>()),
          BlocProvider(create: (context) => sl<FavouriteBloc>()),
          BlocProvider(create: (context) => sl<MealPlannerBloc>()),
          BlocProvider(create: (context) => sl<NetworkBloc>()),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
