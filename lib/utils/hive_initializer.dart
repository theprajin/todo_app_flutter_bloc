import 'package:hive/hive.dart';
import 'package:todo_app/data/data_providers/todo_repository.dart';
import 'package:todo_app/models/todo_model.dart';

Future<void> initializeHive() async {
  //key
  const todoKey = "todoBox";

  //adapters
  Hive.registerAdapter(TodoModelAdapter());

  //box
  final todoBox = await Hive.openBox<TodoModel>(todoKey);

  //repos
  TodoRepository(todosBox: todoBox);
}
