import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/widgets/singleItem.dart';

class ReviewService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text(
          'Total Amount',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "\$ 100.00 ",
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
            onPressed: () {},
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
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          SingleItem(
            searchItemName: 'Transportation',
            searchItemImage: 'assets/transportation.png',
            searchItemSubName: 'Residential',
            isbool: true,
          ),
          SingleItem(
            searchItemName: 'Medical waste',
            searchItemImage: 'assets/medical_waste.png',
            searchItemSubName: 'Municiplle',
            isbool: true,
          ),
          SingleItem(
            searchItemName: 'Plastic Waste',
            searchItemImage: 'assets/plastic_waste.png',
            searchItemSubName: 'Residential',
            isbool: true,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
