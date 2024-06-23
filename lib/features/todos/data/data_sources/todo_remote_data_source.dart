import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/tado_model.dart';

class TodoRemoteDataSource {
  final String apiUrl = "https://jsonplaceholder.typicode.com/todos";

  Future<List<TodoModel>> fetchTodos() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => TodoModel.fromMap(item)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
