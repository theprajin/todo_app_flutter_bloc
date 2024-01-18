import 'package:hive/hive.dart';

import 'package:todo_app/models/todo_model.dart';

class TodoRepository {
  TodoRepository({required Box<TodoModel?> todosBox}) : _todosBox = todosBox;

  final Box<TodoModel?> _todosBox;

  Future<void> saveTodoToHive({required TodoModel todoModel}) async {
    _todosBox.add(todoModel);
    todoModel.save();
  }

  Future<void> deleteTodoFromHive({required TodoModel todoModel}) async {
    todoModel.delete();
  }

  Future<List<TodoModel>> fetchAllTodoFromHive() async {
    List<TodoModel> data = _todosBox.values.toList().cast<TodoModel>();

    return data;
  }
}
