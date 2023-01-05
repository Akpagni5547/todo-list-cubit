import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/screens/cubit_todos/todo_cubit.dart';

// class AddTodoPage extends StatelessWidget {
//   const AddTodoPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => TodosCubit(),
//       child: const AddTodoView(),
//     );
//   }
// }

// BlocProvider.value(
// value: BlocProvider.of<TodosCubit>(context),
// child: const AddTodoView(),
// )


class AddTodoView extends StatelessWidget {
  const AddTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleTodo = TextEditingController();
    TextEditingController descriptionTodo = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add todo '),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: titleTodo,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2.0
                        )
                    ),
                    hintText: 'Ajouter la description'
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: descriptionTodo,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0
                    )
                  ),
                  hintText: 'Ajouter la description'
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ElevatedButton(onPressed: (){
                  context.read<TodosCubit>().addTodo(Todo(title: titleTodo.text, body: descriptionTodo.text, isCompleted: false, id: uuid.v4()));
                  Navigator.pop(context);
                }, child: const Text('Ajouter'))],
              )
            ],
          ),
        ),
      ),
    );
  }
}


// class AddTodoView extends StatelessWidget {
//   const AddTodoView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController titleTodo = TextEditingController();
//     TextEditingController descriptionTodo = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add todo '),
//       ),
//       body: BlocBuilder<TodosCubit, List<Todo>>(builder: (context, todos){
//         return SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: titleTodo,
//                   maxLines: 1,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                               color: Colors.grey,
//                               width: 2.0
//                           )
//                       ),
//                       hintText: 'Ajouter la description'
//                   ),
//                 ),
//                 const SizedBox(height: 20,),
//                 TextFormField(
//                   controller: descriptionTodo,
//                   maxLines: 5,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                               color: Colors.grey,
//                               width: 2.0
//                           )
//                       ),
//                       hintText: 'Ajouter la description'
//                   ),
//                 ),
//                 const SizedBox(height: 20,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [ElevatedButton(onPressed: (){
//                     // context.read<TodosCubit>().addTodo(Todo(title: titleTodo.text, body: descriptionTodo.text, isCompleted: false, id: 7));
//                     Navigator.pop(context);
//                   }, child: const Text('Ajouter'))],
//                 )
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }