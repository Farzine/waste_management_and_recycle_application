import 'package:flutter/material.dart';

enum SigninCharacter { fill, outline }

class WasteTypeOverview extends StatefulWidget {
  final String wasteTypeName;
  final String wasteTypeSubName;
  final String wasteTypeImage;

  WasteTypeOverview({
    required this.wasteTypeName,
    required this.wasteTypeSubName,
    required this.wasteTypeImage,
  });

  @override
  State<WasteTypeOverview> createState() => _WasteTypeOverviewState();
}

class _WasteTypeOverviewState extends State<WasteTypeOverview> {
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
              size: 23,
              color: iconColor,
            ),
            SizedBox(
              width: 1,
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                title,
                style: TextStyle(
                  color: color,
                ),
                textAlign: TextAlign.start,
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
            iconColor: Colors.black,
            backgroundColor: Color.fromARGB(255, 86, 161, 71),
            color: Colors.black,
            title: 'Home',
            iconData: Icons.home,
          ),
          bottomNavigationBar(
            iconColor: Colors.black,
            backgroundColor: Color.fromARGB(255, 86, 161, 71),
            color: Colors.black,
            title: 'Next',
            iconData: Icons.forward_rounded,
          ),
          bottomNavigationBar(
            iconColor: Colors.black,
            backgroundColor: Color.fromARGB(255, 86, 161, 71),
            color: Colors.black,
            title: 'Profile',
            iconData: Icons.person,
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Type wise waste service',
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
                      widget.wasteTypeName ?? "",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      widget.wasteTypeSubName ?? "",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(40),
                    child: Image.asset(widget.wasteTypeImage ?? ""),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Estimated Amounts",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
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
                                ),
                                Text(
                                  'Waste amount: ',
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            Text(
                              "< 5 KG",
                              style: TextStyle(color: Colors.black),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 86, 161, 71),
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete_forever_sharp,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  Text('Clean'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
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
                                ),
                                Text(
                                  'Waste amount: ',
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            Text(
                              "5 <-->10 KG",
                              style: TextStyle(color: Colors.black),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 86, 161, 71),
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete_forever_sharp,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  Text('Clean'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
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
                                ),
                                Text(
                                  'Waste amount: ',
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            Text(
                              "10 <-->20 KG",
                              style: TextStyle(color: Colors.black),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 86, 161, 71),
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete_forever_sharp,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  Text('Clean'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
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
                                ),
                                Text(
                                  'Waste amount: ',
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            Text(
                              "> 20 KG",
                              style: TextStyle(color: Colors.black),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 86, 161, 71),
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete_forever_sharp,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  Text('Clean'),
                                ],
                              ),
                            ),
                          ],
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
    );
  }
}