import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_and_recycle_application/models/delivery_address_model.dart';
import 'package:waste_management_and_recycle_application/providers/checkout_provider.dart';
import 'package:waste_management_and_recycle_application/providers/review_service_provider.dart';
import 'package:waste_management_and_recycle_application/providers/service_provider.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/custom_google_pay.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/delivery_details/single_delivery_Item.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/payment_summary/order.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel deliveryAddressList;
  PaymentSummary({
    required this.deliveryAddressList,
  });

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
    ReviewServiceProvider reviewServiceProvider = Provider.of(context);
    reviewServiceProvider.getReviewCartData();

    double totalPrice = reviewServiceProvider.getTotalPrice();
    double discount = 10;
    double discountValue = 0;
    double total = totalPrice;

    if (totalPrice >= 50) {
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue;
    }

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
        title: Text(
          'Total amount',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '\$ $total',
          style: TextStyle(color: Colors.red[400], fontWeight: FontWeight.bold),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              myType == AddressType.OnlinePayment
                  ? Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CustomGooglePay(
                          total: total,
                        ),
                      ),
                    )
                  : Container();
            },
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
                  SingleDeliveryItem(
                    address:
                        "Division: ${widget.deliveryAddressList.division}, District: ${widget.deliveryAddressList.district}, Union: ${widget.deliveryAddressList.union}, Village: ${widget.deliveryAddressList.village},  Post Code: ${widget.deliveryAddressList.postCode}",
                    title:
                        "${widget.deliveryAddressList.firstName} ${widget.deliveryAddressList.lastName}",
                    number: widget.deliveryAddressList.mobileNo,
                    addressType: widget.deliveryAddressList.addressType ==
                            "addressTypes.Home"
                        ? "Home"
                        : "Work",
                  ),
                  Divider(
                    color: Colors.black45,
                  ),
                  ExpansionTile(
                      children:
                          reviewServiceProvider.getReviewCartDataList.map((e) {
                        return OrderItem(e: e);
                      }).toList(),
                      title: Text(
                        'Order Service ${reviewServiceProvider.getReviewCartDataList.length}',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
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
                      '\$ $totalPrice',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      'Discount',
                    ),
                    trailing: Text(
                      '\$ $discountValue',
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
                      title: Text('Cash after service'),
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
