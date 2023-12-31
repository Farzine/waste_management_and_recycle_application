import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:waste_management_and_recycle_application/screens/home/drawer_side.dart';
import 'package:waste_management_and_recycle_application/screens/home/singal_product.dart';
import 'package:waste_management_and_recycle_application/screens/home/waste_type.dart';
import 'package:waste_management_and_recycle_application/screens/search/search.dart';
import 'package:waste_management_and_recycle_application/screens/service_overview/service_overview.dart';
import 'package:waste_management_and_recycle_application/screens/wasteType_overview/wasteType_OverView.dart';

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
            radius: 15,
            backgroundColor: Color.fromARGB(255, 86, 161, 71),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ),
                );
              },
              icon: Icon(
                size: 25,
                color: Colors.black,
                Icons.search,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Color.fromARGB(255, 86, 161, 71),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(),
                    ),
                  );
                },
                icon: Icon(
                  size: 25,
                  color: Colors.black,
                  Icons.notifications,
                ),
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
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ServiceOverview(
                              serviceName: 'Garbage Service',
                              serviceImage: 'assets/garbage_truck.png',
                              aboutService:
                                  'Looking for reliable garbage collection services? Look no further! Our professional team offers affordable and efficient garbage pickup and disposal for residential and commercial properties. We provide flexible scheduling, convenient curbside pickup, and eco-friendly waste management solutions. Say goodbye to your garbage worries with our top-notch. 10\$ per hour service',
                              serviceSubName: 'subscription',
                              avaiableOption: 'Residential'),
                        ),
                      );
                    },
                  ),
                  SingalProduct(
                    productImage: 'assets/recycle.png',
                    productName: 'Recycle Service',
                    productSubTitle: 'Free',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ServiceOverview(
                              serviceName: 'Recycle Service',
                              serviceImage: 'assets/recycle.png',
                              aboutService:
                                  'Our free recycle service offers convenient collection of recyclable materials, including paper, plastic, glass, and metal. We come to your location to pick up items, saving you time and effort. Help protect the environment by choosing our service to ensure your recyclables are properly handled and diverted from landfills.',
                              serviceSubName: 'Free',
                              avaiableOption: 'Residential'),
                        ),
                      );
                    },
                  ),
                  SingalProduct(
                    productImage: 'assets/transportation.png',
                    productName: 'Transportation',
                    productSubTitle: 'service',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ServiceOverview(
                              serviceName: 'Transportation',
                              serviceImage: 'assets/transportation.png',
                              aboutService:
                                  "Our paid transportation service offers reliable and efficient transportation solutions for individuals and businesses. With a fleet of well-maintained vehicles and professional drivers, we ensure safe and timely delivery of goods and passengers. Whether it's local or long-distance, our service provides a seamless and hassle-free transportation experience.",
                              serviceSubName: 'service',
                              avaiableOption: 'Residential/commercial'),
                        ),
                      );
                    },
                  ),
                  SingalProduct(
                    productImage: 'assets/hazardous.png',
                    productName: 'Hazardous waste',
                    productSubTitle: 'management',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ServiceOverview(
                              serviceName: 'Hazardous waste',
                              serviceImage: 'assets/hazardous.png',
                              aboutService:
                                  'Our paid hazardous waste service provides safe and compliant disposal solutions for businesses and industries. With specialized equipment and trained professionals, we handle the collection, transportation, and disposal of hazardous materials. Ensure environmental responsibility and legal compliance with our reliable and expert hazardous waste management service.',
                              serviceSubName: 'management',
                              avaiableOption: 'Residential/commercial'),
                        ),
                      );
                    },
                  ),
                  SingalProduct(
                    productImage: 'assets/cleaner.png',
                    productName: 'Cleaner Service',
                    productSubTitle: 'subscription',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ServiceOverview(
                              serviceName: 'Cleaner Service',
                              serviceImage: 'assets/cleaner.png',
                              aboutService:
                                  'Our paid cleaner service offers professional and thorough cleaning for homes, offices, and commercial spaces. Our experienced team uses eco-friendly products and modern equipment to ensure a spotless and sanitized environment. With flexible scheduling and personalized attention, we provide a reliable and efficient cleaning solution for your needs.',
                              serviceSubName: 'subscription',
                              avaiableOption: 'Residential'),
                        ),
                      );
                    },
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
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WasteTypeOverview(
                            wasteTypeImage: 'assets/solid_waste.png',
                            wasteTypeName: 'Solid Waste',
                            wasteTypeSubName: 'municipal waste',
                          ),
                        ),
                      );
                    },
                  ),
                  WasteType(
                    WasteTypeImage: 'assets/organic_waste.png',
                    WasteTypeName: 'Organic waste',
                    WasteTypeSubTitle: 'residential waste',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WasteTypeOverview(
                            wasteTypeImage: 'assets/organic_waste.png',
                            wasteTypeName: 'Organic waste',
                            wasteTypeSubName: 'residential waste',
                          ),
                        ),
                      );
                    },
                  ),
                  WasteType(
                    WasteTypeImage: 'assets/medical_waste.png',
                    WasteTypeName: 'Medical waste',
                    WasteTypeSubTitle: 'municipal waste',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WasteTypeOverview(
                            wasteTypeImage: 'assets/medical_waste.png',
                            wasteTypeName: 'Medical waste',
                            wasteTypeSubName: 'municipal waste',
                          ),
                        ),
                      );
                    },
                  ),
                  WasteType(
                    WasteTypeImage: 'assets/eWaste.png',
                    WasteTypeName: 'Electronic Waste',
                    WasteTypeSubTitle: 'residential waste',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WasteTypeOverview(
                            wasteTypeImage: 'assets/eWaste.png',
                            wasteTypeName: 'Electronic Waste',
                            wasteTypeSubName: 'residential waste',
                          ),
                        ),
                      );
                    },
                  ),
                  WasteType(
                    WasteTypeImage: 'assets/plastic_waste.png',
                    WasteTypeName: 'Plastic waste',
                    WasteTypeSubTitle: 'residential',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WasteTypeOverview(
                            wasteTypeImage: 'assets/plastic_waste.png',
                            wasteTypeName: 'Plastic waste',
                            wasteTypeSubName: 'residential waste',
                          ),
                        ),
                      );
                    },
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
