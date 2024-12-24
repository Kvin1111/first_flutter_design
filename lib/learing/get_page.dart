import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'add_get.dart';

class Pagemainformlearn extends StatefulWidget {
  @override
  _PagemainformlearnState createState() => _PagemainformlearnState();
}

class _PagemainformlearnState extends State<Pagemainformlearn> {
  final box = GetStorage();
  List<String> name = [];

  @override
  void initState() {
    super.initState();
    final storedName = box.read('name');
    if (storedName != null) {
      try {
        name = List<String>.from(jsonDecode(storedName));
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Storage Learning'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            final storedName = box.read('name');
            if (storedName != null) {
              try {
                name = List<String>.from(jsonDecode(storedName));
              } catch (e) {
                print('Error decoding JSON: $e');
              }
            }
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: name.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(name[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddGetPage()),
          );
          setState(() {
            final storedName = box.read('name');
            if (storedName != null) {
              try {
                name = List<String>.from(jsonDecode(storedName));
              } catch (e) {
                print('Error decoding JSON: $e');
              }
            }
          });
        },
      ),
    );
  }
}