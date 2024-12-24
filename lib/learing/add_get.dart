import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AddGetPage extends StatefulWidget {
  @override
  _AddGetPageState createState() => _AddGetPageState();
}

class _AddGetPageState extends State<AddGetPage> {
  final box = GetStorage();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create add data'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  if (nameController.text != '') {
                    final oldname = box.read('name');
                    List<String> oldnameList = [];
                    if (oldname != null) {
                      try {
                        oldnameList = List<String>.from(jsonDecode(oldname));
                      } catch (e) {
                        print('Error decoding JSON: $e');
                      }
                    }
                    oldnameList.add(nameController.text);
                    box.write('name', jsonEncode(oldnameList));
                    nameController.text = '';
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
