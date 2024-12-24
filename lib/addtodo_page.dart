// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddtodoPage extends StatefulWidget {
  const AddtodoPage({Key? key}) : super(key: key);

  @override
  _AddtodoPageState createState() => _AddtodoPageState();
}

class _AddtodoPageState extends State<AddtodoPage> {
  final _txttext = TextEditingController();
  final _txtdes = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  
  void addtodo() async {
    try {
      var url = Uri.parse('http://192.168.137.1:3000/todos');
     var response = await http.post(url, body: {
        'title' : _txttext.text,
        'completed': 'false',
        'description':_txtdes.text
      });
       if(response.statusCode == 201){
         ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Created!'))
         );
         Navigator.pop(context, true);
      }
     
    else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to create Todo.')),
        );
      }
     
    } catch (e) {
      log("has error ${e.toString()}");
    }
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Flutter Todos'),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(height: 1),
          )),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Title',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                validator: (valus) {
                  if (valus == null || valus.isEmpty) {
                    return ('Please input Title ');
                  }
                  return null;
                },
                controller: _txttext,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Descripton',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input Description';
                  }
                  return null;
                },
                controller: _txtdes,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            TextButton(
                onPressed: () {
               
                  setState(() {
                   addtodo();
                  });
                  
                  // Navigator.pop(context);
                },
                style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll<Color>(Colors.blue)),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )),
          ],
        ),
      ),
    );
  }
}
