import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/core/constants/app_colors.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/enums.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/extensions.dart';
import 'package:receipe_finder_and_meal_planner/features/network_status/presentation/bloc/network_bloc.dart';

import 'bloc/network_state.dart';

class NetworkWidget extends StatelessWidget {
  const NetworkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
        EnumNetworkStatus status = state.status;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: status == EnumNetworkStatus.connected ? 3 : 40,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: _getColorOnStatus(status)),
          child: _statusWidget(status),
        );
      },
    );
  }

  Widget? _statusWidget(EnumNetworkStatus status) {
    switch (status) {
      case EnumNetworkStatus.connected:
        return null;
      case EnumNetworkStatus.disconnected:
        return _disconnectedWidget();
      case EnumNetworkStatus.connecting:
        return _connectingWidget();
    }
  }

  Widget _connectingWidget() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Connecting..",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      20.widthBox(),
      15.loadingWidget(),
    ],
  );

  Widget _disconnectedWidget() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Disconnected..",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      20.widthBox(),
      Icon(Icons.wifi_off),
    ],
  );

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
