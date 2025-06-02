import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/core/constants/app_colors.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/extensions.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/presentation/_widgets/each_day_widget.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/meal_planner/presentation/bloc/meal_planner_event.dart';

import '../bloc/meal_planner_bloc.dart';
import '../bloc/meal_planner_state.dart';
import 'date_selector_widget.dart';

class MealPlannerWidget extends StatefulWidget {
  const MealPlannerWidget({super.key});

  @override
  State<MealPlannerWidget> createState() => _MealPlannerWidgetState();
}

class _MealPlannerWidgetState extends State<MealPlannerWidget> {
  @override
  void initState() {
    _getInitialData();
    super.initState();
  }

  void _getInitialData() {
    context.read<MealPlannerBloc>().add(GetMealPlannerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealPlannerBloc, MealPlannerState>(
      builder: (context, state) {
        return state.mealPlanner == null
            ? Center(child: 30.loadingWidget(color: AppColors.primary))
            : Column(
              children: [
                DateSelectorWidget(),
                Expanded(child: EachDayWidget(day: state.selectedDay)),
              ],
            );
      },
    );
  }
}
