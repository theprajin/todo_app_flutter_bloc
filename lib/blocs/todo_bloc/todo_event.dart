import 'package:todo_app/models/todo_model.dart';

class TodoEvent {}

class TodoEventInitial extends TodoEvent {}

class TodoAddEvent extends TodoEvent {
  TodoModel todo;
  TodoAddEvent({required this.todo});
}

class TodoDeleteEvent extends TodoEvent {
  TodoModel todo;
  TodoDeleteEvent({required this.todo});
}
