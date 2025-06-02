import 'package:receipe_finder_and_meal_planner/features/network_status/data/network_repo_impl.dart';
import 'package:receipe_finder_and_meal_planner/features/network_status/domain/network_repo.dart';
import 'package:receipe_finder_and_meal_planner/features/network_status/domain/network_use_case.dart';
import 'package:receipe_finder_and_meal_planner/features/network_status/presentation/bloc/network_bloc.dart';

import 'di.dart';

void networkDI() {
  sl.registerSingleton<NetworkRepository>(NetworkRepositoryImpl());
  sl.registerSingleton<NetworkUseCase>(NetworkUseCase(sl()));
  sl.registerFactory<NetworkBloc>(() => NetworkBloc(sl()));
}
