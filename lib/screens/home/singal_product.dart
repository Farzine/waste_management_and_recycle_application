import 'package:flutter/material.dart';

class SingalProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productSubTitle;
  final Function onTap;
  SingalProduct(
      {required this.productImage,
      required this.productName,
      required this.productSubTitle,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 200,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 165, 248, 165),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Image(
                    // image: AssetImage('assets/garbage_truck.png'),
                    image: AssetImage(productImage),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        width: 145,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 86, 161, 71),
                          ),
                          onPressed: () {},
                          child: Column(
                            children: [
                              Text(
                                productName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                productSubTitle,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 44, 44, 44)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
