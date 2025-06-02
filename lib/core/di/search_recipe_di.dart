import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/presentation/bloc/recipe_bloc.dart';

import '../../features/home/tabs/recipe_search/data/recipe_repo_impl.dart';
import '../../features/home/tabs/recipe_search/domain/recipe_repository.dart';
import '../../features/home/tabs/recipe_search/domain/recipe_use_case.dart';
import 'di.dart';

void searchRecipeDI() async {
  sl.registerSingleton<RecipeRepository>(RecipeRepositoryImplementation());
  sl.registerSingleton<RecipeUseCase>(RecipeUseCase(sl()));
  sl.registerFactory<RecipeBloc>(() => RecipeBloc(useCase: sl()));
}
