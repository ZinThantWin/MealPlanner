import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/enums.dart';

import '../domain/network_repo.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  /// add custom domain (preset domain sometimes need vpn)
  final InternetConnection _internetConnection =
      InternetConnection.createInstance(
        useDefaultOptions: false,
        customCheckOptions: [
          InternetCheckOption(uri: Uri.parse("https://www.youtube.com")),
          InternetCheckOption(uri: Uri.parse("https://www.google.com")),
        ],
      );

  @override
  Stream<EnumNetworkStatus> get onStatusChange async* {
    yield await getCurrentStatus();

    await for (final result in _internetConnection.onStatusChange) {
      yield _mapResultToStatus(result);
    }
  }

  @override
  Future<EnumNetworkStatus> getCurrentStatus() async {
    final hasInternet = await _internetConnection.hasInternetAccess;
    return hasInternet
        ? EnumNetworkStatus.connected
        : EnumNetworkStatus.disconnected;
  }

  EnumNetworkStatus _mapResultToStatus(InternetStatus result) {
    switch (result) {
      case InternetStatus.connected:
        return EnumNetworkStatus.connected;
      case InternetStatus.disconnected:
        return EnumNetworkStatus.disconnected;
    }
  }
}
