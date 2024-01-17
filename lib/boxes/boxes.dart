import 'package:hive/hive.dart';
import 'package:todo_app/models/todo_model.dart';

class Boxes {
  static Box<TodoModel> getData() => Hive.box<TodoModel>("todoBox");
}
