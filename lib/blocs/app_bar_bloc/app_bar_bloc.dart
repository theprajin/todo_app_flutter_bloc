import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/app_bar_bloc/app_bar_event.dart';
import 'package:todo_app/blocs/app_bar_bloc/app_bar_state.dart';

class AppBarBloc extends Bloc<AppBarEvent, AppBarState> {
  AppBarBloc() : super(AppBarState(search: false)) {
    on<AppBarEvent>((event, emit) => emit(AppBarState(search: event.search)));
  }
}
