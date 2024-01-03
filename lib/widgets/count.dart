import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_and_recycle_application/providers/review_service_provider.dart';

class Count extends StatefulWidget {
  String serviceName;
  String serviceImage;
  String serviceID;

  String servicePrice;
  Count({
    required this.serviceName,
    required this.serviceID,
    required this.serviceImage,
    required this.servicePrice,
  });

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 0;
  bool istrue = false;
  @override
  Widget build(BuildContext context) {
    ReviewServiceProvider reviewServiceProvider = Provider.of(context);
    return Container(
      height: 25,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Color.fromARGB(255, 86, 161, 71),
      ),
      child: istrue == true || count != 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (count == 0) {
                      setState(() {
                        istrue = false;
                      });
                    }
                    if (count > 0) {
                      setState(() {
                        istrue = false;
                        count -= 5;
                      });
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    size: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '$count KG',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count += 5;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    istrue = true;
                  });
                  reviewServiceProvider.addReviewServiceData(
                    cartID: widget.serviceID,
                    cartImage: widget.serviceImage,
                    cartName: widget.serviceName,
                    cartPrice: widget.servicePrice,
                    cartQuantity: count,
                  );
                },
                child: Text(
                  'Get Service',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
    );
  }
}
