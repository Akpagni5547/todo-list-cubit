import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final String body;
  late bool isCompleted;
  Todo({required this.title, required this.body, required this.isCompleted, required this.id});

  @override
  List<Object?> get props => [id, title, body, isCompleted];

}