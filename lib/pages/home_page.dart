import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:todo_app/blocs/bottom_nav_bloc/bottom_nav_event.dart';
import 'package:todo_app/blocs/bottom_nav_bloc/bottom_nav_state.dart';
import 'package:todo_app/pages/done_page.dart';
import 'package:todo_app/pages/settings/settings_page.dart';
import 'package:todo_app/pages/todo_page/todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    TodoPage(),
    const DonePage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: _pages[state.index],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.check_box_outline_blank),
                label: 'ToDo',
              ),
              BottomNavigationBarItem(
                icon: state.index != 1
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box),
                label: 'Done',
              ),
              BottomNavigationBarItem(
                icon: state.index != 2
                    ? const Icon(Icons.settings_outlined)
                    : const Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: state.index,
            selectedItemColor: Colors.deepPurple,
            onTap: (index) {
              // setState(() {
              //   _selectedIndex = index;
              // });
              context.read<BottomNavBloc>().add(BottomNavEvent(index: index));
            },
          ),
        );
      },
    );
  }
}
