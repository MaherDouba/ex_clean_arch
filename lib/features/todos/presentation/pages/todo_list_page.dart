import 'package:flutter/material.dart';
import '../controllers/todo_controller.dart';

class TodoListPage extends StatefulWidget {
  final TodoController todoController;

  TodoListPage({required this.todoController, Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    await widget.todoController.fetchTodos();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: widget.todoController.todos.length,
              itemBuilder: (context, index) {
                final todo = widget.todoController.todos[index];
                return ListTile(
                  title: Text(todo.title),
                  trailing: Icon(
                    todo.completed ? Icons.check_circle : Icons.circle,
                    color: todo.completed ? Colors.green : Colors.red,
                  ),
                );
              },
            ),
    );
  }
}
