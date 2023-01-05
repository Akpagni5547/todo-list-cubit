import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/screens/add_todo.dart';
import 'package:todo/screens/cubit_todos/todo_cubit.dart';
import 'package:todo/screens/edit_todo.dart';

class ListTodo extends StatelessWidget {
  const ListTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todosBloc = BlocProvider.of<TodosCubit>(context);
    String markAllCompleted = 'MarkAllCompleted';
    String deleteAllCompleted = 'DeleteAllCompleted';
    // final listTodos = context.select((TodosCubit cubit) {
    //   return cubit.state;
    // });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter todos'),
        centerTitle: false,
        actions: [
          const Padding(
              padding: EdgeInsets.only(right: 10), child: Icon(Icons.filter_list)),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: PopupMenuButton(
                // initialValue: deleteAllCompleted,
                onSelected: (String onSelected) {
                  if (onSelected == markAllCompleted) {
                    context.read<TodosCubit>().markAllTodoCompleted();
                  } else {
                    context.read<TodosCubit>().deleteAllTodoCompleted();
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                        value: markAllCompleted,
                        child: const Text('Marquez tous finis'),
                      ),
                      PopupMenuItem(
                          value: deleteAllCompleted,
                          child: const Text('Supprimez tous les todos finis'))
                    ],
                child: const Icon(Icons.more_horiz)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute<AddTodoView>(builder: (context) {
            return BlocProvider.value(
              value: todosBloc,
              child: AddTodoView(),
            );
          }));
          // context.read<TodosCubit>().addTodo(
          // Todo(title: 'hhh', body: 'jjj', isCompleted: false, id: 5));
        },
      ),
      body: BlocBuilder<TodosCubit, List<Todo>>(
        // buildWhen: (previousState, state){
        //   print("previousState $previousState");
        //   print("state $state");
        //   return true;
        // },
        builder: (context, todos) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    key: ValueKey<String>(todos[index].id),
                    background: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.redAccent,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (DismissDirection direction) {
                      context.read<TodosCubit>().deleteTodo(todos[index].id);
                    },
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute<EditTodoPage>(builder: (context) {
                          return BlocProvider.value(
                              value: todosBloc,
                              child: EditTodoPage(todo: todos[index]));
                        }));
                      },
                      leading: Checkbox(
                        value: todos[index].isCompleted,
                        onChanged: (bool? value) {
                          context
                              .read<TodosCubit>()
                              .completedTodo(todos[index].id);
                        },
                      ),
                      title: Text(
                        todos[index].title,
                        style: TextStyle(
                            decoration: todos[index].isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      subtitle: Text(
                        todos[index].body,
                        style: TextStyle(
                            decoration: todos[index].isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                    ));
              },
              itemCount: todos.length,
              scrollDirection: Axis.vertical,
            ),
          );
        },
      ),
    );
  }
}

// CheckboxListTile(
// value: listTodos[index].isCompleted,
// onChanged: (bool? value) {
// context.read<TodosCubit>().completedTodo(listTodos[index].id);
// },
// title: Text(listTodos[index].title, style: TextStyle(
// decoration: listTodos[index].isCompleted ? TextDecoration.lineThrough :TextDecoration.none
// ),),
// ),
