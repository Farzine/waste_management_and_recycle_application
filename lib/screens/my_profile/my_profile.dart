import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/screens/home/drawer_side.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 86, 161, 71),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        elevation: 0.0,
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      drawer: DrawerSide(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: Color.fromARGB(255, 86, 161, 71),
              ),
              Container(
                height: 527,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 164, 180, 165),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Farzine Hosssen',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('farzine07@student.sust.edu'),
                                ],
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    Color.fromARGB(255, 86, 161, 71),
                                child: CircleAvatar(
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 165, 248, 165),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    listTile(
                        icon: Icons.cleaning_services,
                        title: 'My odered Service'),
                    listTile(icon: Icons.location_on, title: 'My Address'),
                    listTile(icon: Icons.person, title: 'Contact Info'),
                    listTile(
                        icon: Icons.file_copy, title: 'Terms & Conditions'),
                    listTile(icon: Icons.policy, title: 'Privacy Policy'),
                    listTile(icon: Icons.add_chart, title: 'About'),
                    listTile(icon: Icons.exit_to_app, title: 'Log Out'),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white60,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/profile_pic.png"),
                radius: 45,
                backgroundColor: Color.fromARGB(255, 165, 248, 165),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
