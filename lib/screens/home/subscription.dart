import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/screens/home_screen.dart';

class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 248, 165),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        title: Text(
          'Subscription',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Subscription Plans',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              SubscriptionCard(
                planName: 'Basic Plan',
                price: '\$9.99/month',
                features: [
                  'Weekly garbage pickup',
                  'Limited customer support',
                ],
              ),
              SizedBox(height: 16),
              SubscriptionCard(
                planName: 'Premium Plan',
                price: '\$19.99/month',
                features: [
                  'Daily garbage pickup',
                  '24/7 customer support',
                  'Recycling service included',
                ],
              ),
              SizedBox(height: 16),
              SubscriptionCard(
                planName: 'Custom Plan',
                price: 'Contact us for pricing',
                features: [
                  'Tailored to your needs',
                  'Flexible scheduling',
                  'Premium customer support',
                ],
              ),
            ],
          ),
        ),
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

class SubscriptionCard extends StatelessWidget {
  final String planName;
  final String price;
  final List<String> features;

  SubscriptionCard({
    required this.planName,
    required this.price,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 138, 240, 138),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              planName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Price: $price',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features.map((feature) {
                return ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text(feature),
                );
              }).toList(),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 86, 161, 71),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Color.fromARGB(255, 138, 240, 138),
                      title: Text('Subscription'),
                      content: Text('You have subscribed to $planName'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child:
                              Text('OK', style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Subscribe', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
