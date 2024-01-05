import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/delivery_details/single_delivery_Item.dart';

class DeliveryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 248, 165),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        title: Text(
          'Delivery service details',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliveryAddress(),
            ),
          );
        },
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        //width: 160,
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddDeliveryAddress(),
              ),
            );
          },
          child: Text("Add new Address"),
          color: Color.fromARGB(255, 86, 161, 71),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Deliver To"),
            leading: Icon(
              Icons.location_on,
              color: Color.fromARGB(255, 86, 161, 71),
              size: 30,
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black45,
          ),
          Column(
            children: [
              SingleDeliveryItem(
                address: 'area, Sylhet/SUST',
                addressType: 'Home',
                title: 'Fazine',
                number: '01793834474',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
