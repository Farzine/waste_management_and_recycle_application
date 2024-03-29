import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_and_recycle_application/models/review_service_model.dart';
import 'package:waste_management_and_recycle_application/providers/review_service_provider.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/delivery_details/delivery_details.dart';
import 'package:waste_management_and_recycle_application/widgets/singleItem.dart';

class ReviewService extends StatefulWidget {
  @override
  State<ReviewService> createState() => _ReviewServiceState();
}

class _ReviewServiceState extends State<ReviewService> {
  late ReviewServiceProvider reviewServiceProvider;

  showAlertDialog(BuildContext context, ReviewCartModel delete) {
    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Delete",
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
        reviewServiceProvider.reviewCartDataDelete(delete.cartID);
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: Color.fromARGB(255, 165, 248, 165),
      title: Text("Review service"),
      content: Text("Do you want to delete the service?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    reviewServiceProvider = Provider.of(context);
    reviewServiceProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text(
          'Total Amount',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "\$ ${reviewServiceProvider.getTotalPrice()} ",
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            color: Color.fromARGB(255, 86, 161, 71),
            child: Text(
              'Submit',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {
              if (reviewServiceProvider.getReviewCartDataList.isEmpty) {
                Fluttertoast.showToast(
                  msg: 'No selected service found',
                );
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DeliveryDetails(),
                  ),
                );
              }
            },
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 165, 248, 165),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        title: Text(
          'Review Purses Sevice',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: reviewServiceProvider.getReviewCartDataList.isEmpty
          ? Center(
              child: Text('No Data'),
            )
          : ListView.builder(
              itemCount: reviewServiceProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewServiceProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      serviceId: data.cartID,
                      serviceName: data.cartName,
                      serviceImage: data.cartImage,
                      serviceSubName: data.cartSubName,
                      servicePrice: data.cartPrice,
                      serviceQuantity: data.cartQuantity,
                      isbool: true,
                      onDelete: () {
                        showAlertDialog(context, data);
                      },
                    ),
                  ],
                );
              },
            ),
    );
  }
}
