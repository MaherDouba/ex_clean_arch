import '../../domain/entities/todo.dart';
import '../../domain/usecases/get_todos.dart';

class TodoController {
  final GetTodos getTodos;

  TodoController({required this.getTodos});

  List<Todo> todos = [];

  Future<void> fetchTodos() async {
    todos = await getTodos();
  }
}
