import 'dart:convert';
import 'package:first_flutter_designer/addtodo_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Map<String, dynamic>> _todos = [];

  // Function to fetch todos
  Future<void> _fetchtodos() async {
    try {
      var url = Uri.parse('http://172.21.48.1:3000/todos');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          _todos = List<Map<String, dynamic>>.from(jsonDecode(response.body));
        });
      } else {
        print('Failed to load todos. Status Code: ${response.statusCode}');
        // More detailed error handling if necessary
      }
    } catch (e) {
      print('Error fetching todos: $e');
    }
  }

  // Function to toggle completed status
  Future toggle(int index) async {
    try {
      var url = Uri.parse('http://172.21.48.1:3000/todos/${_todos[index]['_id']}');
      bool newStatus = !_todos[index]['completed'];

      var response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'completed': newStatus}),
      );

      if (response.statusCode == 200) {
        setState(() {
          _todos[index]['completed'] = newStatus;
        });
      } else {
        print('Failed to update todo. Status Code: ${response.statusCode}');
        print('Response body: ${response.body}');  // Get more details
      }
    } catch (e) {
      print('Error toggling todo: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchtodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title: const Text(
          'Flutter Todos',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _todos.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Checkbox(
                      value: _todos[index]['completed'],
                      onChanged: (value) => toggle(index),
                    ),
                    title: Text(
                      _todos[index]['title'] ?? 'No Title',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(_todos[index]['description'] ?? ''),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddtodoPage()));
        },
      ),
    );
  }
}
