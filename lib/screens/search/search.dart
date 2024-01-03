import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/models/service_model.dart';
import 'package:waste_management_and_recycle_application/widgets/singleItem.dart';

class Search extends StatefulWidget {
  final List<ServiceModel> search;
  Search({required this.search});
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";
  searchItem(String query) {
    List<ServiceModel> searchService = widget.search.where((element) {
      return element.serviceName.toLowerCase().contains(query);
    }).toList();
    return searchService;
  }

  @override
  Widget build(BuildContext context) {
    List<ServiceModel> _searchItem = searchItem(query);
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
              onChanged: (value) {
                print(value);
                setState(() {
                  query = value;
                });
              },
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
          Column(
            children: _searchItem.map(
              (data) {
                return SingleItem(
                  serviceId: data.serviceId,
                  servicePrice: data.servicePrice,
                  serviceQuantity: data.serviceQuantity,
                  serviceName: data.serviceName,
                  serviceImage: data.serviceImage,
                  serviceSubName: data.serviceSubName,
                  isbool: false,
                  onDelete: () {},
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
