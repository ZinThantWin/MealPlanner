import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/favorites/domain/favourite_use_case.dart';

import 'favourite_event.dart';
import 'favourite_state.dart';

final class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteUseCase useCase;

  FavouriteBloc({required this.useCase}) : super(FavouriteState.initial()) {
    on<LoadFavouritesEvent>(_onLoad);
    on<AddToFavouritesEvent>(_onAdd);
    on<RemoveFromFavouritesEvent>(_onRemove);
    add(LoadFavouritesEvent());
  }

  Future<void> _onLoad(
    LoadFavouritesEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final items = await useCase.getAll();
    emit(state.copyWith(favourites: items, isLoading: false));
  }

  Future<void> _onAdd(
    AddToFavouritesEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    await useCase.add(event.recipe);
    add(LoadFavouritesEvent());
  }

  Future<void> _onRemove(
    RemoveFromFavouritesEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    await useCase.remove(event.recipeId);
    add(LoadFavouritesEvent());
  }
}
