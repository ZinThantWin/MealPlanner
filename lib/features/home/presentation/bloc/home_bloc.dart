import 'package:bloc/bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<NavigationTapEvent>(_onTapNavigation);
  }

  void _onTapNavigation(NavigationTapEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(currentTabIndex: event.index));
  }
}
