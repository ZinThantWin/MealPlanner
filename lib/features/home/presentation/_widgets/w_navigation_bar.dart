import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/core/constants/app_colors.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/enums.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/extensions.dart';
import 'package:receipe_finder_and_meal_planner/features/home/presentation/bloc/home_bloc.dart';
import 'package:receipe_finder_and_meal_planner/features/home/presentation/bloc/home_state.dart';

import '../bloc/home_event.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Row(
          children:
              EnumNavBarType.values
                  .asMap()
                  .entries
                  .map(
                    (entry) => _eachNav(
                      type: entry.value,
                      isSelected: entry.key == state.currentTabIndex,
                      onTap: () {
                        context.read<HomeBloc>().add(
                          NavigationTapEvent(index: entry.key),
                        );
                      },
                    ),
                  )
                  .toList(),
        );
      },
    );
  }

  Widget _eachNav({
    required EnumNavBarType type,
    required VoidCallback onTap,
    required bool isSelected,
  }) => Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent, // for better touch
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Icon(
              _getIconData(type: type),
              color: isSelected ? AppColors.black : AppColors.gray,
            ),
            Text(
              type.name.capitalizeFirst(),
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                fontSize: 16,
                color: isSelected ? AppColors.black : AppColors.gray,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  IconData _getIconData({required EnumNavBarType type}) {
    switch (type) {
      case EnumNavBarType.mealPlanner:
        return Icons.calendar_month;
      case EnumNavBarType.favourites:
        return Icons.favorite_outlined;
      case EnumNavBarType.search:
        return Icons.home;
    }
  }
}
