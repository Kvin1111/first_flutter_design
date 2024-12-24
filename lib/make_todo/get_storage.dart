import 'package:first_flutter_designer/make_todo/add_getstorage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class GetstoragePage extends StatefulWidget {
   GetstoragePage({super.key});
  
  @override
  State<GetstoragePage> createState() => _GetStorageState();
}

class _GetStorageState extends State<GetstoragePage> {
  final box = GetStorage();
  List<String> names = []; // Remove final here
  @override
  void initState() {
    super.initState();
    box.read('names');// Initialize names in initState
  }

  void addName(String nameNew) {
    setState(() {
      names.add(nameNew);
      box.write('names', names);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Storage'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(names[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final newName = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddGetstorage()),
          );

          if (newName != null && newName is String && newName.isNotEmpty) {
            addName(newName); // Add the new name to the list
          }
        },
      ),
    );
  }
}
