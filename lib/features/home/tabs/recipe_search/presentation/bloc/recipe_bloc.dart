import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/presentation/bloc/recipe_event.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/presentation/bloc/recipe_state.dart';

import '../../domain/recipe_use_case.dart';

final class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc({required this.useCase}) : super(RecipeState.initial()) {
    on<RecipeSearchEvent>(_onRecipeSearchEvent);
    on<FetchRecipeDetailEvent>(_onRecipeDetailEvent);
    on<SetRecipeDetailEvent>(_onSetRecipeDetailEvent);
  }
  final RecipeUseCase useCase;

  Future<void> _onSetRecipeDetailEvent(
    SetRecipeDetailEvent event,
    Emitter<RecipeState> emit,
  ) async {
    emit(state.copyWith(detailRecipe: event.detail));
  }

  Future<void> _onRecipeDetailEvent(
    FetchRecipeDetailEvent event,
    Emitter<RecipeState> emit,
  ) async {
    emit(state.copyWith(gettingDetail: true));
    final res = await useCase.getDetail(event.id);
    emit(
      state.copyWith(
        clearDetailRecipe: res == null,
        gettingDetail: false,
        detailRecipe: res,
      ),
    );
  }

  Future<void> _onRecipeSearchEvent(
    RecipeSearchEvent event,
    Emitter<RecipeState> emit,
  ) async {
    emit(state.copyWith(isSearching: true));
    final res = await useCase.search(query: event.query);
    emit(
      state.copyWith(searchResults: res, isSearching: false, errorMessage: ""),
    );
  }
}
