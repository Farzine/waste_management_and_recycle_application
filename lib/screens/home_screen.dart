import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget WasteType() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 165, 248, 165),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image(
              image: AssetImage('assets/garbage_truck.png'),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 45,
                  width: 145,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 86, 161, 71),
                    ),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Text(
                          'Garbage Service',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'subscription',
                          style:
                              TextStyle(color: Color.fromARGB(255, 44, 44, 44)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }

  Widget singalProducts() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 165, 248, 165),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image(
              image: AssetImage('assets/garbage_truck.png'),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 45,
                  width: 145,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 86, 161, 71),
                    ),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Text(
                          'Garbage Service',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'subscription',
                          style:
                              TextStyle(color: Color.fromARGB(255, 44, 44, 44)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 180, 180),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 86, 161, 71),
          width: double.infinity,
          height: double.infinity,
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          CircleAvatar(
            radius: 13,
            backgroundColor: Color.fromARGB(255, 165, 248, 165),
            child: Icon(
              Icons.search,
              size: 17,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Color.fromARGB(255, 165, 248, 165),
              child: Icon(
                Icons.notifications,
                size: 17,
                color: Colors.black,
              ),
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/Dustbin_set.png'),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      //color: Colors.red,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 50),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor:
                                  Color.fromARGB(255, 165, 248, 165),
                              child: Icon(
                                Icons.subscriptions,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            'Subscription',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                              shadows: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.green,
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //color: Colors.yellow,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 50),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor:
                                  Color.fromARGB(255, 165, 248, 165),
                              child: Icon(
                                Icons.garage,
                                size: 35,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            'Special Pick Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                              shadows: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.green,
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Our Service',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'view all',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select waste type',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Pickup point',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  WasteType(),
                  WasteType(),
                  WasteType(),
                  WasteType(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
