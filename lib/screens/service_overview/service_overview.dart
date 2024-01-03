import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/screens/home_screen.dart';
import 'package:waste_management_and_recycle_application/screens/review%20service/review_service.dart';
import 'package:waste_management_and_recycle_application/widgets/count.dart';

enum SigninCharacter { fill, outline }

class ServiceOverview extends StatefulWidget {
  final String serviceName;
  final String serviceSubName;
  final String serviceImage;
  final String aboutService;
  final String avaiableOption;
  final String serviceId;
  final int servicePrice;
  final int serviceQuantity;
  ServiceOverview({
    required this.servicePrice,
    required this.serviceQuantity,
    required this.serviceId,
    required this.serviceName,
    required this.serviceImage,
    required this.aboutService,
    required this.serviceSubName,
    required this.avaiableOption,
  });

  @override
  State<ServiceOverview> createState() => _ServiceOverviewState();
}

class _ServiceOverviewState extends State<ServiceOverview> {
  SigninCharacter _character = SigninCharacter.fill;

  Widget bottomNavigationBar({
    required String title,
    required IconData iconData,
    required Function onTap,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: Color.fromARGB(255, 86, 161, 71),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 25,
              color: Colors.black,
            ),
            SizedBox(
              width: 1,
            ),
            OutlinedButton(
              onPressed: () {
                onTap();
              },
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 165, 248, 165),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 248, 165),
      bottomNavigationBar: Row(
        children: [
          bottomNavigationBar(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ReviewService(),
                ),
              );
            },
            title: 'Proceed to continue',
            iconData: Icons.arrow_circle_right_outlined,
          ),
          bottomNavigationBar(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            title: 'Back to home',
            iconData: Icons.arrow_circle_left_outlined,
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Serveice overview',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      widget.serviceName ?? "null",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      widget.serviceSubName ?? "null",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(40),
                    child: Image.asset(widget.serviceImage ?? "null"),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Available Options",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.black,
                            ),
                            Radio(
                              value: SigninCharacter.fill,
                              groupValue: _character,
                              onChanged: (value) {
                                setState(() {
                                  _character = value!;
                                });
                              },
                              activeColor: Color.fromARGB(255, 86, 161, 71),
                            )
                          ],
                        ),
                        Text(widget.avaiableOption ?? "null"),
                        Count(
                          serviceQuantity: widget.serviceQuantity,
                          serviceSubName: widget.serviceSubName,
                          serviceId: widget.serviceId,
                          serviceImage: widget.serviceImage,
                          serviceName: widget.serviceName,
                          servicePrice: widget.servicePrice,
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
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About This service',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.aboutService ?? "null"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
