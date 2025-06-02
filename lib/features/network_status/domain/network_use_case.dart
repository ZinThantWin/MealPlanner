import 'package:receipe_finder_and_meal_planner/core/utils/enums.dart';
import 'package:receipe_finder_and_meal_planner/features/network_status/domain/network_repo.dart';

final class NetworkUseCase {
  final NetworkRepository repository;

  NetworkUseCase(this.repository);

  Stream<EnumNetworkStatus> onStatusChange() {
    return repository.onStatusChange;
  }

  Future<EnumNetworkStatus> getCurrentStatus() async {
    return await repository.getCurrentStatus();
  }
}
