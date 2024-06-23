import '../../domain/entities/todo.dart';

abstract class TodoRepository {
  
  Future<List<Todo>> getTodos();
}
