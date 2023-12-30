import 'package:flutter/material.dart';

enum SigninCharacter { fill, outline }

class ServiceOverview extends StatefulWidget {
  final String serviceName;
  final String serviceSubName;
  final String serviceImage;
  final String aboutService;
  final String avaiableOption;
  ServiceOverview({
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

  Widget bottomNavigationBar(
      {required Color iconColor,
      required Color backgroundColor,
      required Color color,
      required String title,
      required IconData iconData}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17,
              color: iconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: color),
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
            iconColor: Colors.black,
            backgroundColor: Color.fromARGB(255, 86, 161, 71),
            color: Colors.black,
            title: 'Proceed to continue',
            iconData: Icons.arrow_circle_right_outlined,
          ),
          bottomNavigationBar(
            iconColor: Colors.black,
            backgroundColor: Color.fromARGB(255, 207, 123, 104),
            color: Colors.black,
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
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 86, 161, 71),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.phone,
                                size: 20,
                                color: Colors.black,
                              ),
                              Text('Contact'),
                            ],
                          ),
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
