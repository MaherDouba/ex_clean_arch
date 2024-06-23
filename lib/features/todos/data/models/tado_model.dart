class TodoModel {
  final int id;
  final String title;
  final bool completed;

  TodoModel({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
    );
  }
}
