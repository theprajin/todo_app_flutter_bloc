import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/blocs/app_bar_bloc/app_bar_bloc.dart';
import 'package:todo_app/blocs/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:todo_app/blocs/todo_bloc/todo_bloc.dart';
import 'package:todo_app/boxes/boxes.dart';
import 'package:todo_app/data/data_providers/todo_repository.dart';

import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/utils/hive_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await initializeHive();

  // Hive.registerAdapter(TodoModelAdapter());

  // await Hive.openBox<TodoModel>('todoBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBloc()),
        BlocProvider(create: (context) => AppBarBloc()),
        BlocProvider(
            create: (context) => TodoBloc(
                todoRepository: TodoRepository(todosBox: Boxes.getData()))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
