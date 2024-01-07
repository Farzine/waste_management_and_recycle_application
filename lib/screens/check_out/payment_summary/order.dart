import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/models/review_service_model.dart';

class OrderItem extends StatelessWidget {
  final ReviewCartModel e;
  OrderItem({required this.e});

  late bool isTrue;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        e.cartImage,
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            e.cartName,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            '${e.cartQuantity} KG',
          ),
          Text(
            '\$ ${e.cartPrice}',
          ),
        ],
      ),
      subtitle: Text(e.cartSubName),
    );
  }
}
