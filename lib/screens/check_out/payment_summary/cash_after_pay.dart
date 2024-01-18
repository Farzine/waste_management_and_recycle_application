import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_and_recycle_application/providers/review_service_provider.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/payment_summary/order.dart';
import 'package:waste_management_and_recycle_application/screens/home_screen.dart';

class Cash_after_service extends StatefulWidget {
  final double total;
  Cash_after_service({required this.total});

  @override
  State<Cash_after_service> createState() => _Cash_after_serviceState();
}

class _Cash_after_serviceState extends State<Cash_after_service> {
  @override
  Widget build(BuildContext context) {
    ReviewServiceProvider reviewServiceProvider = Provider.of(context);
    reviewServiceProvider.getReviewCartData();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 248, 165),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        title: Text(
          'Cash after service',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ExpansionTile(
                children: reviewServiceProvider.getReviewCartDataList.map((e) {
                  return OrderItem(e: e);
                }).toList(),
                title: Text(
                  'Ordered Service ${reviewServiceProvider.getReviewCartDataList.length}',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            Container(
              child: Column(
                children: [
                  Text(
                    "Total Amount: \$ ${widget.total}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your ordered service has been placed successfully",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
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
