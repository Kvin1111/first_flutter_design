import 'dart:convert';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class TodoNew extends StatefulWidget {
  const TodoNew({ Key? key }) : super(key: key);

  @override
  _TodoNewState createState() => _TodoNewState();
}

class _TodoNewState extends State<TodoNew> {
  Future _fetchtodo ()async {
    var url = Uri.parse('http://172.21.48.1:3000/todos');
    var response =  await http.get(url);
    return jsonDecode (response.body);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: const Text('Flutter Todos '),
          actions: [
            TextButton.icon(onPressed: (){}, label: const Icon(Icons.menu)),
           const Padding(
             padding:  EdgeInsets.all(8.0),
             child:  Icon(Icons.more_horiz),
           )
          ],
        ),
        body: Column(
          children: [
            	FutureBuilder(future: _fetchtodo(), builder: (context , snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                  
                } else if (snapshot.hasError) {
                      return Text('has error ${snapshot.error}');
                    }
                final todo = snapshot.data;
                return ListView.builder(
                  itemCount: todo.length,
                  itemBuilder: (BuildContext context , int index){
                    
                    return ListTile(
                      leading: Checkbox(value: todo[index]['completed'], onChanged: (value){
                      },
                      ),
                      title: Text(todo[index]['tittle']),
                      subtitle: Text(todo[index]['description']),
                    );
                });

              })
          ],
        ),
    );
  }
}