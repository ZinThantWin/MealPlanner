import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/super_print.dart';

import '../../features/network_status/presentation/bloc/network_bloc.dart';
import '../../features/network_status/presentation/bloc/network_state.dart';
import '../constants/app_colors.dart';
import '../utils/enums.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<NetworkBloc, NetworkState>(
              builder: (context, state) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _getColorOnStatus(
                          state.status,
                        ).withAlpha(opacityToAlpha(0.3)),
                        AppColors.white,
                        AppColors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Color _getColorOnStatus(EnumNetworkStatus status) {
    switch (status) {
      case EnumNetworkStatus.connected:
        return AppColors.primary;
      case EnumNetworkStatus.disconnected:
        return Colors.grey;
      case EnumNetworkStatus.connecting:
        return Colors.yellow;
    }
  }
}
