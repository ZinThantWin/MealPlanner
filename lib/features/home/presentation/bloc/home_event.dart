import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class NavigationTapEvent extends HomeEvent {
  const NavigationTapEvent({required this.index});

  final int index;

  @override
  List<Object> get props => [index];
}
