import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class TodosCubit extends Cubit<List<Todo>> {
  TodosCubit(List<Todo> initialState)
      : super(initialState);

  void addTodo(Todo todo) {
    var todos = [...state, todo];
    emit(todos);
  }

  void completedTodo(String id) {
    var todos = [...state];
    var indexTodo = todos.indexWhere((element) => element.id == id);
    todos[indexTodo].isCompleted = !todos[indexTodo].isCompleted;
    emit(todos);
  }

  void deleteTodo(String id){
    var todos = [...state];
    var indexTodo = todos.indexWhere((element) => element.id == id);
    todos.removeAt(indexTodo);
    emit(todos);
  }

  void updateTodo(Todo todo){
    var todos = [...state];
    var indexTodo = todos.indexWhere((element) => element.id == todo.id);
    todos[indexTodo] = Todo(title: todo.title, body: todo.body, isCompleted: todo.isCompleted, id: todo.id);
    emit(todos);
  }

  void markAllTodoCompleted(){
    var todos = [...state];
    List<Todo> todosMarked = [];
    for (var todo in todos){
      todosMarked.add(Todo(title: todo.title, body: todo.body, isCompleted: true, id: todo.id));
    }
    emit(todosMarked);
  }

  void deleteAllTodoCompleted(){
    var todos = [...state];
    List<Todo> deleteTodoCompleted = todos.where((element) => element.isCompleted == false).toList();
    emit(deleteTodoCompleted);
  }
}
