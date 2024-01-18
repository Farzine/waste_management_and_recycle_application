import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/screens/home_screen.dart';

class FAQsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 248, 165),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        title: Text(
          'FAQs',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            FAQItem(
              question: 'What types of garbage do you collect?',
              answer: 'We collect both organic and inorganic waste.',
            ),
            FAQItem(
              question: 'How often is garbage pickup scheduled?',
              answer: 'Garbage pickup is scheduled twice a week in your area.',
            ),
            FAQItem(
              question: 'Can I request a special pickup for large items?',
              answer:
                  'Yes, you can request a special pickup for large items. Contact our customer support for assistance.',
            ),
            FAQItem(
              question: 'Is recycling available?',
              answer:
                  'Yes, we have a recycling program in place. Separate your recyclables from regular waste.',
            ),
            // Add more FAQItem widgets for additional questions
          ],
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

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 151, 243, 151),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        iconColor: Colors.black,
        textColor: Colors.black,
        title: Text(
          question,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(answer),
          ),
        ],
      ),
    );
  }
}
