import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AddGetstorage extends StatelessWidget {
  AddGetstorage({super.key});
  final nameController = TextEditingController();
  final box = GetStorage();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add data'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input some data';
                  }
                  return null;
                },
                controller: nameController,
                decoration:
                    const InputDecoration(hintText: 'input what you want'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      try {
                        box.write('names', nameController.text); // Save the updated list
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Completed')));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: $e')));
                      }
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
