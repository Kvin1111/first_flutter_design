import 'dart:convert';
import 'dart:developer';

import 'package:first_flutter_designer/make_todo/Login.dart';
import 'package:first_flutter_designer/make_todo/add_page.dart';
import 'package:first_flutter_designer/make_todo/services/auth_local_service.dart';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../core/constant.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  TodoPageState createState() => TodoPageState();
}

class TodoPageState extends State<TodoPage> {
  List<Map<String, dynamic>> _todos = [];

  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    getdata();
  }

  Future<void> getdata() async {
    try {
      _todos.clear();
      var url = Uri.parse('$beseUrl/todos');
      var response = await http.get(url);
      log('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        setState(() {
          _todos = List<Map<String, dynamic>>.from(jsonDecode(response.body));
          isLoading = false;
        });
      } else {
        log('Error fetching todos: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching todos: $e');
    }
  }

  Future<void> updatecheck(int index) async {
    try {
      var url = Uri.parse('$beseUrl/todos/${_todos[index]['_id']}');
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
        log('Failed to update todo. Status Code: ${response.statusCode}');
        log('Response body: ${response.body}');
      }
    } catch (e) {
      log('Error toggling todo: $e');
    }
  }

  Future<void> deleteById(int index) async {
    try {
      // Get the ID of the todo item at the given index
      final todoId = _todos[index]['_id'];
      var url = Uri.parse('$beseUrl/todos/$todoId');

      // Perform the DELETE request
      var response = await http.delete(url);

      if (response.statusCode == 200) {
        // Remove the item from the list if deletion is successful
        _todos.removeAt(index);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('delected!')));
        // Update the UI if this is in a StatefulWidget
        setState(() {});
      } else {
        print('Failed to delete item: ${response.body}');
      }
    } catch (e) {
      print('Error deleting item: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black45,
        title: const Text('Flutter Todos'),
        actions: [
          TextButton(onPressed: () async{
            await AuthLocalService().removeToken();
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> LoginPage()));
          }, child: const Icon(Icons.logout)),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_horiz),
          )
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: getdata,
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      final result = await Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) {
                        return AddPage(
                          todo: _todos[index],
                        );
                      }));

                      log('on update');
                      if (result == true) {
                        getdata(); // Refresh the list on return
                      }
                    },
                    title: Text(_todos[index]['title']),
                    subtitle: Text(_todos[index]['description']),
                    leading: Checkbox(
                      value: _todos[index]['completed'],
                      onChanged: (value) {
                        updatecheck(index);
                      },
                    ),
                    trailing: PopupMenuButton(onSelected: (value) {
                      if (value == 'edit') {
                      } else if (value == 'delect') {
                        deleteById(index);
                      }
                    }, itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text('edit'),
                        ),
                        const PopupMenuItem(
                            value: 'delect', child: Text('Delect'))
                      ];
                    }),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPage()),
          );

          if (result) {
            getdata();
          }
        },
      ),
    );
  }
}
