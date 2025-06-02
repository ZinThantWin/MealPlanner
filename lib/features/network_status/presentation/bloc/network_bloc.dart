import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/enums.dart';

import '../../domain/network_repo.dart';
import 'network_event.dart';
import 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final NetworkRepository repository;
  StreamSubscription? _subscription;

  NetworkBloc(this.repository)
    : super(const NetworkState(EnumNetworkStatus.connecting)) {
    on<NetworkStatusChanged>(_onNetworkStatusChanged);
    on<GetNetworkStatusEvent>(_onGetNetworkStatus);

    /// start stream on init
    _subscription = repository.onStatusChange.listen(
      (status) => add(NetworkStatusChanged(status)),
    );
  }
  void _onGetNetworkStatus(
    GetNetworkStatusEvent event,
    Emitter<NetworkState> emit,
  ) async {
    final status = await repository.getCurrentStatus();
    emit(NetworkState(status));
  }

  void _onNetworkStatusChanged(
    NetworkStatusChanged event,
    Emitter<NetworkState> emit,
  ) {
    emit(NetworkState(event.status));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
