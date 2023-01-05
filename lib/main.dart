import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/counter_cubit.dart';
import 'package:todo/counter_page.dart';
import 'package:todo/screens/cubit_todos/todo_cubit.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/screens/list_todo.dart';

import 'models/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CounterCubit(),
          ),
          BlocProvider(create: (_) => TodosCubit(
              [
                Todo(
                    id: uuid.v4(),
                    title: 'Faire a manger',
                    body: 'Tres tot le matin',
                    isCompleted: false),
                Todo(
                    id: uuid.v4(),
                    title: 'Faire a dormir',
                    body: 'Tres tot le midi',
                    isCompleted: false),
                Todo(
                    id: uuid.v4(),
                    title: 'Faire a chanter',
                    body: 'Tres tot le soir',
                    isCompleted: false),
              ]
          ))
        ],
        child: const HomePage(),
      ),
    );
  }
}
