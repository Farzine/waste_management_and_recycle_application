import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:waste_management_and_recycle_application/screens/home/drawer_side.dart';
import 'package:waste_management_and_recycle_application/screens/home/singal_product.dart';
import 'package:waste_management_and_recycle_application/screens/home/waste_type.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 180, 180),
      drawer: DrawerSide(),
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
                          Container(
                            height: 20,
                            width: 112,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 86, 161, 71),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {},
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Subscription',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
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
                          Container(
                            height: 20,
                            width: 125,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 86, 161, 71),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              onPressed: () {},
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Special Pickup',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
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
                  SingalProduct(
                    productImage: 'assets/garbage_truck.png',
                    productName: 'Garbage Service',
                    productSubTitle: 'subscription',
                    onTap: () {},
                  ),
                  SingalProduct(
                    productImage: 'assets/recycle.png',
                    productName: 'Recycle Service',
                    productSubTitle: 'Free',
                    onTap: () {},
                  ),
                  SingalProduct(
                    productImage: 'assets/transportation.png',
                    productName: 'Transportation',
                    productSubTitle: 'service',
                    onTap: () {},
                  ),
                  SingalProduct(
                    productImage: 'assets/hazardous.png',
                    productName: 'Hazardous waste',
                    productSubTitle: 'management',
                    onTap: () {},
                  ),
                  SingalProduct(
                    productImage: 'assets/cleaner.png',
                    productName: 'Cleaner Service',
                    productSubTitle: 'subscription',
                    onTap: () {},
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
                  WasteType(
                    WasteTypeImage: 'assets/solid_waste.png',
                    WasteTypeName: 'Solid Waste',
                    WasteTypeSubTitle: 'municipal waste',
                    onTap: () {},
                  ),
                  WasteType(
                    WasteTypeImage: 'assets/organic_waste.png',
                    WasteTypeName: 'Organic waste',
                    WasteTypeSubTitle: 'residential waste',
                    onTap: () {},
                  ),
                  WasteType(
                    WasteTypeImage: 'assets/medical_waste.png',
                    WasteTypeName: 'Medical waste',
                    WasteTypeSubTitle: 'municipal waste',
                    onTap: () {},
                  ),
                  WasteType(
                    WasteTypeImage: 'assets/eWaste.png',
                    WasteTypeName: 'Electronic Waste',
                    WasteTypeSubTitle: 'residential waste',
                    onTap: () {},
                  ),
                  WasteType(
                    WasteTypeImage: 'assets/plastic_waste.png',
                    WasteTypeName: 'Plastic waste',
                    WasteTypeSubTitle: 'municiple waste',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
