// ignore_for_file: use_build_context_synchronously

import 'dart:developer';


import 'package:first_flutter_designer/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AddPage extends StatefulWidget {
  final Map<String, dynamic>? todo ;
   AddPage({Key? key, this.todo}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.todo != null){
      title.text = widget.todo!['title'];
      des.text = widget.todo!['description'];

    }
  }
  final  title = TextEditingController();

  final  des = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  Future<void> editData ()async{
    try {
        var url = Uri.parse('$beseUrl/todos/${widget.todo!['_id']}');
      var response = await http.put(url, body: {
        'title': title.text,
        'completed': 'false',
        'description': des.text
      });
      if(response.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Updated!'))
        );
        
        Navigator.pop(context ,true);
      }
    } catch (e) {
      
      log('has error ${e.toString()}');
    }
    
  }
  Future sumitData (BuildContext context)async{
    try {
      var url = Uri.parse('$beseUrl/todos');
      var response = await http.post(url, body: {
        'title': title.text,
        'completed': 'false',
        'description': des.text
      });
      if(response.statusCode == 201){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Created!'))
        );

        Navigator.pop(context ,true);
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Create Filled'))
        );
      }
    } catch (e) {
      log('has error ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: const Text('Add Todo page'),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Title',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              
              child: TextFormField(
                controller: title,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return ('Please input title');
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: des,
                decoration: const InputDecoration(
                    ),
                validator: (value){
                  if(value == null || value.isEmpty ){
                    return 'Plase input descrption';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(onPressed: ()async{
            if(_formkey.currentState!.validate()){
              if(widget.todo != null ){
                log('buttion update ');
           await     editData();
              }
              else {
                log('buttion add');
               await  sumitData(context);
              }

             
            }
            }, child: Text(widget.todo != null ?'Update': 'Create'))
          ],
          
        ),
      ),
    );
  }
}
