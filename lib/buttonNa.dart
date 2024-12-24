
import 'package:first_flutter_designer/TestA.dart';

import 'package:first_flutter_designer/testb.dart';
import 'package:flutter/material.dart';

class HomeScreenb extends StatefulWidget {
  const HomeScreenb ({Key? key}) : super(key: key);

  @override
  _ButtonNaState createState() => _ButtonNaState();
}

class _ButtonNaState extends State<HomeScreenb> {
  int selectedIndex = 0;
  final List<Widget> lstscreen = [
    Testb(),
    TestA()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('TestButton'),
      ),
      body: lstscreen[selectedIndex],
      backgroundColor:Colors.black ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: (index){
            setState(() {
              selectedIndex = index;
            });
            print('print $index');
        },
        items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Notification')
        ]),
    );
  }
}
