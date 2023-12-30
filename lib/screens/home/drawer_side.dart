import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/screens/home_screen.dart';
import 'package:waste_management_and_recycle_application/screens/my_profile/my_profile.dart';
import 'package:waste_management_and_recycle_application/screens/service_overview/service_overview.dart';

class DrawerSide extends StatelessWidget {
  Widget listTile(
      {required IconData icon,
      required String title,
      required Function onTap}) {
    return ListTile(
      onTap: () => onTap(),
      leading: Icon(
        icon,
        size: 25,
        color: Color.fromARGB(255, 86, 161, 71),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 165, 248, 165),
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Color.fromARGB(255, 86, 161, 71),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset('assets/Garbage.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome User"),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 30,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 86, 161, 71),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            listTile(
              icon: Icons.home,
              title: 'Home',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            listTile(
              icon: Icons.account_box,
              title: 'My Profile',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyProfile(),
                  ),
                );
              },
            ),
            listTile(
              icon: Icons.notifications,
              title: 'Notification',
              onTap: () {
                // Future(() {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => HomeScreen()));
                // });
              },
            ),
            listTile(
              icon: Icons.cleaning_services,
              title: 'Our Service',
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
            listTile(
              icon: Icons.location_on_outlined,
              title: 'Pickup Points',
              onTap: () {},
            ),
            listTile(
              icon: Icons.subscriptions_outlined,
              title: 'Subscription',
              onTap: () {},
            ),
            listTile(
                icon: Icons.rate_review_outlined,
                title: 'Rating & Review',
                onTap: () {}),
            listTile(icon: Icons.message_rounded, title: 'FAQs', onTap: () {}),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact Support'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Call us: '),
                      SizedBox(
                        width: 10,
                      ),
                      Text('01793834474'),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text('Mail us: '),
                        SizedBox(
                          width: 10,
                        ),
                        Text('farzine07@student.sust.edu'),
                      ],
                    ),
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
