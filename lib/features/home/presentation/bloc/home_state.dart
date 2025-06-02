import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({this.currentTabIndex = 0});

  final int currentTabIndex;

  @override
  List<Object> get props => [currentTabIndex];

  HomeState copyWith({int? currentTabIndex, bool? isInternetValid}) {
    return HomeState(currentTabIndex: currentTabIndex ?? this.currentTabIndex);
  }
}
