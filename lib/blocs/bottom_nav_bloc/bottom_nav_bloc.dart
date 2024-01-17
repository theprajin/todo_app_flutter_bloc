import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/bottom_nav_bloc/bottom_nav_event.dart';
import 'package:todo_app/blocs/bottom_nav_bloc/bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState(index: 0)) {
    on<BottomNavEvent>(_index);
  }

  _index(BottomNavEvent event, Emitter emit) {
    emit(BottomNavState(index: event.index));
  }
}
