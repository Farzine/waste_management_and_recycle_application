import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/screens/search/search_item.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 248, 165),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        title: Text(
          'Search',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Service item'),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white60,
                filled: true,
                hintText: 'Search for services',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SearchItem(
            searchItemName: 'Recycle Service',
            searchItemImage: 'assets/recycle.png',
            searchItemSubName: 'Free',
          ),
          SearchItem(
            searchItemName: 'Transportation',
            searchItemImage: 'assets/transportation.png',
            searchItemSubName: 'Residential',
          ),
          SearchItem(
            searchItemName: 'Medical waste',
            searchItemImage: 'assets/medical_waste.png',
            searchItemSubName: 'Municiplle',
          ),
          SearchItem(
            searchItemName: 'Plastic Waste',
            searchItemImage: 'assets/plastic_waste.png',
            searchItemSubName: 'Residential',
          ),
        ],
      ),
    );
  }
}
