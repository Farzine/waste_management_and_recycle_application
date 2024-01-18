import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/models/review_service_model.dart';

class OrderItem extends StatefulWidget {
  final ReviewCartModel e;
  OrderItem({required this.e});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  late bool isTrue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        widget.e.cartImage,
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.e.cartName,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            '${widget.e.cartQuantity} KG',
          ),
          Text(
            '\$ ${widget.e.cartPrice}',
          ),
        ],
      ),
      subtitle: Text(widget.e.cartSubName),
    );
  }
}
