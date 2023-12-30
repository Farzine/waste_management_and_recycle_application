import 'package:flutter/material.dart';

class DrawerSide extends StatelessWidget {
  Widget listTile({required IconData icon, required String title}) {
    return ListTile(
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
            listTile(icon: Icons.home, title: 'Home'),
            listTile(icon: Icons.account_box, title: 'My Profile'),
            listTile(icon: Icons.notifications, title: 'Notification'),
            listTile(icon: Icons.cleaning_services, title: 'Ouer Service'),
            listTile(icon: Icons.location_on_outlined, title: 'Pickup Points'),
            listTile(icon: Icons.subscriptions_outlined, title: 'Subscription'),
            listTile(
                icon: Icons.rate_review_outlined, title: 'Rating & Review'),
            listTile(icon: Icons.message_rounded, title: 'FAQs'),
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
