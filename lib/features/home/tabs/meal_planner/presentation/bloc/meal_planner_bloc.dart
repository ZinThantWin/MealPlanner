import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/domain/meal_planner_use_case.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/presentation/bloc/meal_planner_event.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/presentation/bloc/meal_planner_state.dart';

final class MealPlannerBloc extends Bloc<MealPlannerEvent, MealPlannerState> {
  final MealPlannerUseCase useCase;

  MealPlannerBloc({required this.useCase}) : super(MealPlannerState.initial()) {
    on<AddMealPlannerEvent>(_onAddMealPlanner);
    on<GetMealPlannerEvent>(_onGetMealPlanner);
    on<DeleteMealPlannerEvent>(_onDeleteMeal);
    on<SelectMealPlannerEvent>(_onSelectMealPlanner);
  }

  Future<void> _onAddMealPlanner(
    AddMealPlannerEvent event,
    Emitter<MealPlannerState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await useCase.saveMealPlan(meal: event.meal, id: event.id);
    emit(state.copyWith(isLoading: false));
    add(GetMealPlannerEvent());
  }

  void _onSelectMealPlanner(
    SelectMealPlannerEvent event,
    Emitter<MealPlannerState> emit,
  ) {
    emit(state.copyWith(selectedDay: event.selectedDay));
  }

  Future<void> _onDeleteMeal(
    DeleteMealPlannerEvent event,
    Emitter<MealPlannerState> emit,
  ) async {
    await useCase.deleteMeal(event.key);
    add(GetMealPlannerEvent());
  }

  Future<void> _onGetMealPlanner(
    GetMealPlannerEvent event,
    Emitter<MealPlannerState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final mealPlanner = await useCase.getMealPlanner();

    final selectedDayDate = state.selectedDay?.date;
    final newSelectedDay = mealPlanner.mealPlanner.firstWhere(
      (e) => e.date == selectedDayDate,
      orElse: () => mealPlanner.mealPlanner.first,
    );

    emit(
      state.copyWith(
        isLoading: false,
        mealPlanner: mealPlanner,
        selectedDay: newSelectedDay,
      ),
    );
  }
}
