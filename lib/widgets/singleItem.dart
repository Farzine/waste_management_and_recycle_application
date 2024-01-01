import 'package:flutter/material.dart';

class SingleItem extends StatelessWidget {
  bool isbool = false;

  final String searchItemName;
  final String searchItemSubName;
  final String searchItemImage;

  SingleItem(
      {required this.searchItemName,
      required this.searchItemSubName,
      required this.searchItemImage,
      required this.isbool});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
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
                    mainAxisAlignment: isbool == false
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Text(
                              searchItemName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              searchItemSubName,
                            ),
                          ],
                        ),
                      ),
                      isbool == false
                          ? Container(
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
                            )
                          : Text('\$ 50.00'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: isbool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: isbool == false
                      ? Container(
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
                        )
                      : Column(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 20,
                              width: 70,
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
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
        isbool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black,
              ),
      ],
    );
  }
}
