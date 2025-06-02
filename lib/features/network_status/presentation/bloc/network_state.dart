import 'package:equatable/equatable.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/enums.dart';

class NetworkState extends Equatable {
  final EnumNetworkStatus status;

  const NetworkState(this.status);

  @override
  List<Object> get props => [status];
}
