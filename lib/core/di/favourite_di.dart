import 'package:hive/hive.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/favorites/presentation/bloc/favourite_bloc.dart';

import '../../features/home/tabs/favorites/data/favourite_repo_impl.dart';
import '../../features/home/tabs/favorites/domain/favourite_repository.dart';
import '../../features/home/tabs/favorites/domain/favourite_use_case.dart';
import '../../features/home/tabs/recipe_search/data/recipe_detail_model.dart';
import '../constants/hive_constants.dart';
import 'di.dart';

void favouriteRecipeDI() {
  sl.registerSingleton<FavouriteRepository>(
    FavouriteRepositoryImplementation(
      Hive.box<RecipeDetailModel>(HiveConstants.favouriteBox),
    ),
  );
  sl.registerSingleton<FavouriteUseCase>(FavouriteUseCase(sl()));
  sl.registerFactory<FavouriteBloc>(() => FavouriteBloc(useCase: sl()));
}
