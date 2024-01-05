import 'package:flutter/material.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String title;
  final String address;
  final String number;
  final String addressType;
  SingleDeliveryItem(
      {required this.address,
      required this.addressType,
      required this.number,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Container(
                width: 60,
                padding: EdgeInsets.all(1),
                height: 20,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 86, 161, 71),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    addressType,
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 8,
            backgroundColor: Color.fromARGB(255, 86, 161, 71),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address),
              SizedBox(
                height: 5,
              ),
              Text(number),
            ],
          ),
        ),
        Divider(
          height: 35,
          color: Colors.black45,
        ),
      ],
    );
  }
}
