import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:waste_management_and_recycle_application/providers/review_service_provider.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/payment_summary/order.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ReviewServiceProvider reviewServiceProvider = Provider.of(context);
    reviewServiceProvider.getReviewCartData();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 248, 165),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        title: Text(
          'Notification',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'Service Processing ${reviewServiceProvider.getReviewCartDataList.length}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(Icons.notifications, color: Colors.black),
            onTap: () {},
          ),
          if (true)
            Column(
              children: reviewServiceProvider.getReviewCartDataList.map((e) {
                return Column(
                  children: [
                    OrderItem(e: e),
                    SizedBox(height: 5),
                    Text(
                      'Expected Arrival Time: 02.00 PM',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 75, 71, 71),
                      ),
                    ),
                    Divider(
                      color: Colors.black45,
                    ),
                  ],
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
