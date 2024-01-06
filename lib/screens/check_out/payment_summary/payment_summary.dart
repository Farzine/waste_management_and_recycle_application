import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/payment_summary/order.dart';

class PaymentSummary extends StatefulWidget {
  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

enum AddressType {
  OnlinePayment,
  COD,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressType.COD;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 248, 165),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        title: Text(
          'Payment summary',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text('Total amount'),
        subtitle: Text(
          '\$500',
          style: TextStyle(color: Colors.red[400], fontWeight: FontWeight.bold),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {},
            child: Text(
              'Place Order',
              style: TextStyle(color: Colors.black),
            ),
            color: Color.fromARGB(255, 86, 161, 71),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text('First & Last Name'),
                    subtitle: Text('area, Rangpur, Gaibandha '),
                  ),
                  Divider(
                    color: Colors.black45,
                  ),
                  ExpansionTile(children: [
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                  ], title: Text('Order Item 6')),
                  Divider(
                    color: Colors.black45,
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      'Sub total',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '\$100',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      'Shiping charge',
                    ),
                    trailing: Text(
                      '\$100',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      'Discount',
                    ),
                    trailing: Text(
                      '\$10',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: Colors.black45,
                  ),
                  ListTile(
                    leading: Text('Payment Options'),
                  ),
                  RadioListTile(
                      title: Text('Cash on Delivery'),
                      secondary: Icon(
                        Icons.monetization_on,
                        color: Color.fromARGB(255, 86, 161, 71),
                      ),
                      value: AddressType.COD,
                      groupValue: myType,
                      onChanged: (value) {
                        setState(() {
                          myType = value!;
                        });
                      }),
                  RadioListTile(
                      title: Text('Online Payment'),
                      secondary: Icon(
                        Icons.payments,
                        color: Color.fromARGB(255, 86, 161, 71),
                      ),
                      value: AddressType.OnlinePayment,
                      groupValue: myType,
                      onChanged: (value) {
                        setState(() {
                          myType = value!;
                        });
                      }),
                ],
              );
            }),
      ),
    );
  }
}
