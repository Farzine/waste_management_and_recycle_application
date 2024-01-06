import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  late bool isTrue;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/garbage_truck.png',
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'service name',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            '50kg',
          ),
          Text(
            '50\$',
          ),
        ],
      ),
    );
  }
}
