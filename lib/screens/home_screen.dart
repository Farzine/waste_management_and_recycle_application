import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_and_recycle_application/providers/service_provider.dart';
import 'package:waste_management_and_recycle_application/providers/user_provider.dart';
import 'package:waste_management_and_recycle_application/providers/wasteType_provider.dart';
import 'package:waste_management_and_recycle_application/screens/home/drawer_side.dart';
import 'package:waste_management_and_recycle_application/screens/home/singal_product.dart';
import 'package:waste_management_and_recycle_application/screens/home/waste_type.dart';
import 'package:waste_management_and_recycle_application/screens/search/search.dart';
import 'package:waste_management_and_recycle_application/screens/service_overview/service_overview.dart';
import 'package:waste_management_and_recycle_application/screens/wasteType_overview/wasteType_OverView.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ServiceProvider serviceProvider;
  late WasteTypeProvider wasteTypeProvider;
  @override
  void initState() {
    ServiceProvider serviceProvider = Provider.of(context, listen: false);
    serviceProvider.fatchServiceData();
    WasteTypeProvider wasteTypeProvider = Provider.of(context, listen: false);
    wasteTypeProvider.fatchWasteTypeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context);
    serviceProvider = Provider.of(context);
    wasteTypeProvider = Provider.of(context);
    userProvider.getUserData();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 180, 180),
      drawer: DrawerSide(userProvider: userProvider),
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
                    builder: (context) =>
                        Search(search: serviceProvider.getAllServiceSearch),
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
                      builder: (context) => Search(search: []),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Search(
                            search: serviceProvider.getServiceDataList,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'view all',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: serviceProvider.getServiceDataList.map(
                  (serviceData) {
                    return SingalProduct(
                      productImage: serviceData.serviceImage,
                      productName: serviceData.serviceName,
                      productSubTitle: serviceData.serviceSubName,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ServiceOverview(
                              servicePrice: serviceData.servicePrice,
                              serviceQuantity: serviceData.serviceQuantity,
                              serviceId: serviceData.serviceId,
                              serviceName: serviceData.serviceName,
                              serviceImage: serviceData.serviceImage,
                              aboutService: serviceData.aboutService,
                              serviceSubName: serviceData.serviceSubName,
                              avaiableOption: serviceData.serviceOption,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Search(
                            search: serviceProvider.getServiceDataList,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'view all',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: wasteTypeProvider.getWasteTypeDataList.map(
                  (wasteTypeData) {
                    return WasteType(
                      WasteTypeImage: wasteTypeData.wasteTypeImage,
                      WasteTypeName: wasteTypeData.wasteTypeName,
                      WasteTypeSubTitle: wasteTypeData.wasteTypeSubTitle,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => WasteTypeOverview(
                              userProvider: userProvider,
                              wasteTypeImage: wasteTypeData.wasteTypeImage,
                              wasteTypeName: wasteTypeData.wasteTypeName,
                              wasteTypeSubName: wasteTypeData.wasteTypeSubName,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
