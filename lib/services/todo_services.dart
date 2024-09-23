import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todoapp/models/todo.dart';

class TodoServices {
  final String baseUrl = 'https://ac6d-2402-3a80-1bd3-7a5a-7c77-8a7-a40a-765.ngrok-free.app/api/todos';

  Future<List<Todo>> getTodos() async {
    final response = await http.get(Uri.parse(baseUrl));
    // print('this is response $Uri.parse(baseUrl)');
    // print('this is response $response');
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Todo.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<Todo> getTodoById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load todo');
        }
  }

  Future<void> addTodo(Todo todo) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String> {"Content-Type": "application/json; charset=UTF-8"},
      body: json.encode(todo.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create todo');
    }
  }

  Future<void> updateTodo(String id, Todo todo) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String> {"Content-Type": "application/json; charset=UTF-8"},
      body: json.encode(todo.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update todo');
    }
  }

  Future<void> deleteTodo(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo');
    }
  }
}
