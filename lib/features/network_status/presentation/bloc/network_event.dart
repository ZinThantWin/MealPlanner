import 'package:equatable/equatable.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/enums.dart';

abstract class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

class NetworkStatusChanged extends NetworkEvent {
  final EnumNetworkStatus status;

  const NetworkStatusChanged(this.status);

  @override
  List<Object> get props => [status];
}

class GetNetworkStatusEvent extends NetworkEvent {}
