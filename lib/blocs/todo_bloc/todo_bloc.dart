import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo_bloc/todo_event.dart';
import 'package:todo_app/blocs/todo_bloc/todo_state.dart';
import 'package:todo_app/data/data_providers/todo_repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;
  TodoBloc({required this.todoRepository}) : super(TodoState(todos: [])) {
    on<TodoEventInitial>(_initialTodoList);
    on<TodoAddEvent>(_addTodoList);
    on<TodoDeleteEvent>(_deleteTodoItem);
  }

  _initialTodoList(TodoEventInitial event, Emitter emit) async {
    emit(TodoState(todos: await todoRepository.fetchAllTodoFromHive()));
  }

  _addTodoList(TodoAddEvent event, Emitter emit) async {
    await todoRepository.saveTodoToHive(todoModel: event.todo);
    emit(TodoState(todos: await todoRepository.fetchAllTodoFromHive()));
  }

  _deleteTodoItem(TodoDeleteEvent event, Emitter emit) async {
    await todoRepository.deleteTodoFromHive(todoModel: event.todo);
    emit(TodoState(todos: await todoRepository.fetchAllTodoFromHive()));
  }
}
