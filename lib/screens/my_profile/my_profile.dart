import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_and_recycle_application/auth/sign_in.dart';
import 'package:waste_management_and_recycle_application/models/user_model.dart';
import 'package:waste_management_and_recycle_application/providers/user_provider.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/delivery_details/delivery_details.dart';
import 'package:waste_management_and_recycle_application/screens/home/drawer_side.dart';
import 'package:waste_management_and_recycle_application/screens/my_profile/privacy_policy.dart';
import 'package:waste_management_and_recycle_application/screens/my_profile/terms_and_condition.dart';
import 'package:waste_management_and_recycle_application/screens/notification/notification.dart';

class MyProfile extends StatefulWidget {
  UserModel userData;
  MyProfile({required this.userData});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget listTile(
      {required IconData icon,
      required String title,
      required Function() onTap}) {
    return Column(
      children: [
        Divider(
          height: 1,
          color: Colors.black,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            onTap();
          },
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
                                    widget.userData.userName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(widget.userData.userEmail),
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
                        title: 'My odered Service',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationPage()));
                        }),
                    listTile(
                        icon: Icons.location_on,
                        title: 'My Address',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DeliveryDetails()));
                        }),
                    listTile(
                        icon: Icons.person,
                        title: 'Contact Info',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DeliveryDetails()));
                        }),
                    listTile(
                        icon: Icons.file_copy,
                        title: 'Terms & Conditions',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TermsAndConditionsScreen()));
                        }),
                    listTile(
                        icon: Icons.policy,
                        title: 'Privacy Policy',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrivacyPolicyScreen()));
                        }),
                    listTile(
                        icon: Icons.add_chart, title: 'About', onTap: () {}),
                    listTile(
                        icon: Icons.exit_to_app,
                        title: 'Log Out',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        }),
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
                backgroundImage: NetworkImage(widget.userData.userImage ??
                    'https://static.vecteezy.com/system/resources/previews/020/765/399/non_2x/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg'),
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
