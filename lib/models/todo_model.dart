import 'package:hive/hive.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 1)
class TodoModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final bool isDone;

  TodoModel({required this.title, this.isDone = false});
}
