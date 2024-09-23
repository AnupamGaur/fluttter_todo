import 'package:flutter/material.dart';
import '../services/todo_services.dart';
import '../models/todo.dart';

class AddTodoScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TodoServices _todoService = TodoServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final todo = Todo(
                  id: '',
                  title: _titleController.text,
                  body: _bodyController.text,
                  completed: false,
                );
                _todoService.addTodo(todo).then((_) {
                  Navigator.pop(context);
                });
              },
              child: Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}