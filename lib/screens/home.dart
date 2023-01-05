import 'package:flutter/material.dart';
import 'package:todo/screens/list_todo.dart';
import 'package:todo/screens/stat_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  static const List<Widget> page = [
    ListTodo(),
    StatTodoPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.query_stats),
              label: 'Stats',
          ),
        ],
      ),
      body: page[currentIndex],
    );
  }
}
