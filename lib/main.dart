
import 'package:first_flutter_designer/List.dart';

import 'package:first_flutter_designer/make_todo/get_storage.dart';


import 'package:first_flutter_designer/todo_screen.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
void main() async{
   await GetStorage.init(); 
  runApp(Home());
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // 'future_builder':(context)=> FutureBuilderTest(),
        'todo_screen': (context)=> Home(),
      },
      initialRoute:  'todo_screen',
      // // initialRoute: 'TodoScreen',
      //  home: FutureBuilderTest(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
class Main extends StatefulWidget {
  const Main({ Key? key }) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int selectIndex = 0 ;
  final List<Widget> strindex = [List1(), Container(), ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: strindex[selectIndex],
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            selectIndex = index;
          });
          print('Index $index');
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),

        ],
      ),
    );

  }
}

// class Homescreen extends StatefulWidget {
//   Homescreen({Key? key}) : super(key: key);

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   final List indexnew = [
//     'AC',
//     '+/-',
//     '%',
//     '/',
//     '7',
//     '8',
//     '9',
//     'X',
//     '4',
//     '5',
//     '6',
//     '-',
//     '1',
//     '2',
//     '3',
//     '+',
//      Icons.refresh,
//     '0',
//     '.',
//     '='
   
//   ];

//   String value = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Calcutator',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         leading: const Icon(Icons.menu),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 20),
//             child: Icon(Icons.sunny),
//           ),
//           Icon(Icons.nightlight_round),
//         ],
//       ),
//       body: Column(
//         children: [
//            Padding(
//             padding:  const EdgeInsets.only(right: 15),
//             child:  Align(
//               alignment: Alignment.topRight,
//               child: Text(value,style: const TextStyle(
//                 fontSize: 13,
//               ),),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GridView.builder(
//               shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: indexnew.length,
//             gridDelegate:
//                 const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
//             itemBuilder: (context, index) {
//               Color backColor = Colors.grey;
//               Color textcolor = Colors.white;
    
//               if(index == 0 || index == 1 || index == 2){
//                 textcolor = Colors.red;
//               }else if(index == 3 || index == 7 || index == 11 || index == 15 || index == 19){
//                 textcolor = Colors.amber;
//               }
              
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     if(value.isEmpty){
//                       value = indexnew[index];
//                     }
                     

//                   });
                 
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Container(
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: backColor,
//                     ),
//                     child: index ==16? Icon(indexnew[index]): Text(indexnew[index],style: TextStyle(
//                       color: textcolor,
//                       fontSize: 20
//                     ),),
//                   ),
//                 ),
//               );
//             }
//             ),
//           ),
//         ],
//       )
//     );
//   }
// }
