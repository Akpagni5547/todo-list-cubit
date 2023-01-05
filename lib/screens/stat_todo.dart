import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/screens/cubit_todos/todo_cubit.dart';

class StatTodoPage extends StatelessWidget {
  const StatTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listTodo = context.select((TodosCubit cubit) {
      var todoCompleted =
          cubit.state.where((element) => element.isCompleted == true).length;
      var todoNoCompleted =
          cubit.state.where((element) => element.isCompleted == false).length;
      return {"completed": todoCompleted, "inCompleted": todoNoCompleted};
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter todos'),
        centerTitle: false,
        actions: const [Icon(Icons.filter), Icon(Icons.more)],
      ),
      body: BlocBuilder<TodosCubit, List<Todo>>(
        builder: (context, todos) {
          return SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Todo non fini :',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(listTodo['inCompleted'].toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Todo fini :',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(listTodo['completed'].toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
