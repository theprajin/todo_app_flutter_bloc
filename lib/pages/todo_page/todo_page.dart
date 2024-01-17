import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/blocs/app_bar_bloc/app_bar_bloc.dart';
import 'package:todo_app/blocs/app_bar_bloc/app_bar_event.dart';
import 'package:todo_app/blocs/app_bar_bloc/app_bar_state.dart';
import 'package:todo_app/boxes/boxes.dart';
import 'package:todo_app/constants/gap_sizes.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/pages/todo_page/widgets/todo_item.dart';

class TodoPage extends StatelessWidget {
  TodoPage({Key? key}) : super(key: key);

  final titleController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppBarBloc, AppBarState>(
        builder: (context, state) {
          return Scaffold(
            appBar: state.search == false
                ? AppBar(
                    title: const Text('ToDo'),
                    actions: [
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          child: const Icon(Icons.search),
                          onTap: () {
                            context
                                .read<AppBarBloc>()
                                .add(AppBarEvent(search: true));
                          },
                        ),
                      ),
                    ],
                  )
                : AppBar(
                    title: const TextField(
                      autocorrect: false,
                      autofocus: true,
                      decoration: InputDecoration(hintText: 'Search'),
                    ),
                    actions: [
                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: const Icon(Icons.close),
                        ),
                        onTap: () {
                          context
                              .read<AppBarBloc>()
                              .add(AppBarEvent(search: false));
                        },
                      ),
                    ],
                  ),
            body: ValueListenableBuilder<Box<TodoModel>>(
              valueListenable: Boxes.getData().listenable(),
              builder: (context, box, _) {
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    var data = box.values.toList().cast<TodoModel>();

                    return Column(
                      children: [
                        todoItems(
                          context: context,
                          title: data[index].title,
                          isDone: data[index].isDone,
                          deleteFunc: () => delete(data[index]),
                        ),
                        gapH10
                      ],
                    );
                  },
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Add Todo'),
                    actions: [
                      TextField(
                        controller: titleController,
                        autocorrect: false,
                        autofocus: true,
                        decoration:
                            const InputDecoration(hintText: 'Your Todo title'),
                        keyboardType: TextInputType.text,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              final data =
                                  TodoModel(title: titleController.text);
                              final box = Boxes.getData();
                              box.add(data);
                              data.save();

                              titleController.clear();
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  void delete(TodoModel todoModel) async {
    await todoModel.delete();
  }
}
