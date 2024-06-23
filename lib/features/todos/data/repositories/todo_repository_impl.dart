import '../data_sources/todo_remote_data_source.dart';
import '../../domain/entities/todo.dart'; 
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;

  TodoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Todo>> getTodos() async {
    final todoModels = await remoteDataSource.fetchTodos();
    // تحويل القائمة من TodoModel إلى Todo
    return todoModels.map((todoModel) => Todo(
      id: todoModel.id,
      title: todoModel.title,
      completed: todoModel.completed,
    )).toList();
  }
}
