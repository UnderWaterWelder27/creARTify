import 'package:creartify/presentation/navigation_page/bloc/navigation_event.dart';
import 'package:creartify/presentation/navigation_page/bloc/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(pageIndex: 0)) {
    on<NavigationChangedPageEvent>(
      (event, emit) => emit(NavigationState(pageIndex: event.pageIndex))
    );
  }
}