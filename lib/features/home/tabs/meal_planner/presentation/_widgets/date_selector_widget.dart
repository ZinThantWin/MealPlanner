import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/presentation/_widgets/meal_day_chip.dart';

import '../bloc/meal_planner_bloc.dart';
import '../bloc/meal_planner_event.dart';
import '../bloc/meal_planner_state.dart';

class DateSelectorWidget extends StatelessWidget {
  const DateSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealPlannerBloc, MealPlannerState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 5,
              children:
                  state.mealPlanner!.mealPlanner.map((e) {
                    return MealDayChip(
                      each: e,
                      isSelected: state.selectedDay?.date == e.date,
                      onTap: () {
                        context.read<MealPlannerBloc>().add(
                          SelectMealPlannerEvent(e),
                        );
                      },
                    );
                  }).toList(),
            ),
          ),
        );
      },
    );
  }
}
