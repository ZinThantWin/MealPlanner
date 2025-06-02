import 'package:equatable/equatable.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/domain/meal_planner_entity.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/domain/weekly_meal_entity.dart';

final class MealPlannerState extends Equatable {
  final MealPlannerEntity? mealPlanner;
  final bool isLoading;
  final WeeklyMealEntity? selectedDay;

  const MealPlannerState({
    required this.mealPlanner,
    required this.isLoading,
    required this.selectedDay,
  });

  factory MealPlannerState.initial() =>
      MealPlannerState(mealPlanner: null, isLoading: false, selectedDay: null);

  MealPlannerState copyWith({
    MealPlannerEntity? mealPlanner,
    bool? isLoading,
    WeeklyMealEntity? selectedDay,
  }) => MealPlannerState(
    mealPlanner: mealPlanner ?? this.mealPlanner,
    isLoading: isLoading ?? this.isLoading,
    selectedDay: selectedDay ?? this.selectedDay,
  );

  @override
  List<Object?> get props => [mealPlanner, isLoading, selectedDay];
}
