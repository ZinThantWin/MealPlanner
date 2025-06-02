import 'package:receipe_finder_and_meal_planner/core/utils/enums.dart';

abstract class NetworkRepository {
  Stream<EnumNetworkStatus> get onStatusChange;
  Future<EnumNetworkStatus> getCurrentStatus();
}
