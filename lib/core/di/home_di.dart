import 'package:receipe_finder_and_meal_planner/features/home/presentation/bloc/home_bloc.dart';

import 'di.dart';

void homeDI() {
  sl.registerLazySingleton<HomeBloc>(() => HomeBloc());
}
