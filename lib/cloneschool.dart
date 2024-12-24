import 'package:flutter/material.dart';

class Cloneschool extends StatelessWidget {
  Cloneschool({super.key});
  final List sle = [
    {'price': '144 courses'},
    {'price': '144 courses'},
    {'price': '144 courses'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const Icon(Icons.menu),
        title: const Text(
          'Video',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.shop),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: 'Search ...',
                          filled: false,
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize
                                .min, // Ensures it takes only necessary space
                            children: [
                              Text(
                                'Fiter', // Your desired text
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.arrow_drop_down), // Arrow icon
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sle.length,
              itemBuilder: (BuildContext context, int index) {
                Color colorindex = Colors.black;
                if (index == 2) {
                  colorindex = Colors.yellow;
                } else if (index == 1) {
                  colorindex = Colors.blue;
                }
            
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: 300,
                            height: 210,
                            decoration: BoxDecoration(color: colorindex),
                            child: Icon(Icons.shopping_basket),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              child: const Icon(Icons.shopping_basket),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
              
            ),
            
          ),
          const SizedBox(
            height: 60,
          ),
          const Divider(),
          Row(
            children: [
              ListView.builder(
                itemBuilder: (BuildContext context,int index){
                  Row(
                      children: [
                        Stack(
                          children: [
                            Expanded(
                              child: Container(
                                width: 200,
                                
                                color: Colors.blue,
                                ),
                            ),
                            
                          ],
                        )
                      ],
                  );
                },
              )
            ]
          
          )
        ],
        
        
      ),
    );
  }
}
