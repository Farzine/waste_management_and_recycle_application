import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_and_recycle_application/providers/review_service_provider.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/payment_summary/order.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/payment_summary/payment_config.dart';
import 'package:waste_management_and_recycle_application/screens/home_screen.dart';

class CustomGooglePay extends StatefulWidget {
  final double total;
  CustomGooglePay({required this.total});

  @override
  State<CustomGooglePay> createState() => _CustomGooglePayState();
}

class _CustomGooglePayState extends State<CustomGooglePay> {
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 165, 248, 165),
          title: Text('Order Confirmed'),
          content: Text('Payment completed. Thank you!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ReviewServiceProvider reviewServiceProvider = Provider.of(context);

    reviewServiceProvider.getReviewCartData();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 248, 165),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        title: Text(
          'Pay with Google',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
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
                  GooglePayButton(
                    onPressed: () {
                      _showConfirmationDialog(context);
                    },

                    //paymentConfigurationAsset: 'sample_payment_configuration.json',
                    paymentConfiguration:
                        PaymentConfiguration.fromJsonString(defaultGooglePay),
                    paymentItems: [
                      PaymentItem(
                        label: 'Total Amount',
                        amount: '\$ ${widget.total}',
                        status: PaymentItemStatus.final_price,
                      )
                    ],
                    width: double.infinity,

                    type: GooglePayButtonType.pay,
                    margin: const EdgeInsets.only(top: 15.0),
                    onPaymentResult: (result) {
                      log(result.toString());
                    },

                    loadingIndicator: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
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
