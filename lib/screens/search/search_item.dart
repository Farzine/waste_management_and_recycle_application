import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final String searchItemName;
  final String searchItemSubName;
  final String searchItemImage;
  SearchItem(
      {required this.searchItemName,
      required this.searchItemSubName,
      required this.searchItemImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              child: Center(
                child: Image.asset(searchItemImage),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          searchItemName,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          searchItemSubName,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(color: Colors.white60),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('5 KG'),
                        ),
                        Center(
                          child: Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 32),
              child: Container(
                height: 20,
                width: 35,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 86, 161, 71),
                  border: Border.all(color: Colors.white60),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 20,
                      ),
                      Text('ADD'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
