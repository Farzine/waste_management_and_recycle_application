import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class CustomGooglePay extends StatelessWidget {
  final double total;
  CustomGooglePay({required this.total});

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: GooglePayButton(
          paymentConfigurationAsset: 'sample_payment_configuration.json',
          paymentItems: [
            PaymentItem(
              label: 'Total Amount',
              amount: '\$ $total',
              status: PaymentItemStatus.final_price,
            )
          ],
          type: GooglePayButtonType.pay,
          margin: const EdgeInsets.only(top: 15.0),
          onPaymentResult: (result) {
            log(result.toString());
          },
          loadingIndicator: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
