import 'package:flutter/material.dart';

class Clone1 extends StatelessWidget {
  Clone1({super.key});
  final List cardnum = ['1', '2', '3'];
  final List sub = ['1', '2', '3', '4', '5'];
  final List<dynamic> cardItem = [
    {
      'authorName': 'Sok Dara',
      'authorImageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREOme6vZXapI-HTNJXRwstlO_vjjF59Wt6cQ&s',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRk2SIGSFYsIkjQopNDNCwD_SZOupH9eO36w&s',
      'title': 'Java Programming'
    },
    {
      'authorName': 'Sok Ra',
      'authorImageUrl':
          'https://pics.craiyon.com/2023-11-26/oMNPpACzTtO5OVERUZwh3Q.webp',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGaKFreQiFEn4cDLfTmMgR1R_pmk7w_VTuSA&s',
      'title': 'C# Programming'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.menu),
            title: const Text('Video'),
            centerTitle: true,
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.shopping_basket_sharp),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.notifications),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.music_note),
              )
            ],
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(height: 1),
            )),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: const TextField(
                    decoration: InputDecoration(
                        filled: false,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        suffix: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Filter'),
                            Icon(Icons.arrow_drop_down)
                          ],
                        )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 210,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cardnum.length,
                  itemBuilder: (BuildContext context, int index) {
                    Color cadcolor = Colors.red;
                    if (index == 0) {
                      cadcolor = Colors.black;
                    } else if (index == 1) {
                      cadcolor = Colors.blue;
                    }
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 8, left: 4, right: 8, bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(alignment: Alignment.bottomRight, children: [
                            Container(width: 300, height: 200, color: cadcolor),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: const Icon(Icons.shopping_cart),
                              ),
                            )
                          ])
                        ],
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Column(
                children: [
                  const Divider(),
                  Expanded(
                    child: GridView.builder(
                        itemCount: cardItem.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // ចំនួនជួរដេក
                          mainAxisExtent: 280, // កំណត់កម្ពស់
                          crossAxisSpacing: 5, // ចន្លោះគ្នាទៅជួរដេក
                          mainAxisSpacing: 5, // ចន្លោះគ្នាទៅជួរឈរ
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 260,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.grey)),
                                      ),
                                      const Align(
                                        alignment: Alignment.topCenter,
                                      ),
                                      Image.network(
                                          cardItem[index]['imageUrl']),
                                      Positioned(
                                        bottom: 120,
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        cardItem[index]
                                                            ['authorImageUrl']),
                                                    fit: BoxFit.cover),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 1.0,
                                                    style: BorderStyle
                                                        .solid), //Border.all
                                                /*** The BorderRadius widget  is here ***/
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10),
                                                ), //Bo),
                                              ),
                                            )),
                                      ),
                                      Positioned(
                                          bottom: 170,
                                          left: 80,
                                          child: Text(
                                            cardItem[index]['authorName'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                      Positioned(
                                        bottom: 100,
                                        left: 30,
                                        child: Text(
                                          cardItem[index]['title'],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 180,
                                        left: 10,
                                        
                                        right: 10,
                                         // Make it span horizontally
                                        child:  Divider(
                                          color: Colors.grey,
                                          

                                        ),
                                      ),
                                      Positioned(
                                        bottom: 15,
                                        right: 15,
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color.fromARGB(
                                                  255, 162, 221, 227)),
                                          child: Icon(
                                            Icons.shopping_cart,
                                            color: Colors.lightBlue,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
