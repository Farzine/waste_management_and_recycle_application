import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/screens/home_screen.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 248, 165),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        title: Text(
          'Privacy Policy',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Welcome to the Garbage Management App!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'By using this app, you agree to the following terms and conditions:',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          Text(
            '1. You will use the app responsibly and in accordance with local laws.',
          ),
          Text(
            '2. You will provide accurate information when using the app.',
          ),
          Text(
            '3. You will not misuse the app for any illegal or harmful activities.',
          ),
          Text(
            '4. The app is provided "as is" without any warranties.',
          ),
          Text(
            '5. We reserve the right to update the terms and conditions at any time.',
          ),
          SizedBox(height: 16),
          Text(
            'Thank you for using our Garbage Management App!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          child: Text("Back to Home"),
          color: Color.fromARGB(255, 86, 161, 71),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
