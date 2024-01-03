import 'package:flutter/material.dart';

class SingleItem extends StatelessWidget {
  bool isbool = false;

  final String serviceName;
  final String serviceSubName;
  final String serviceImage;
  final int servicePrice;
  final int serviceQuantity;
  String serviceId;
  Function onDelete;

  SingleItem({
    required this.onDelete,
    required this.serviceId,
    required this.servicePrice,
    required this.serviceQuantity,
    required this.serviceName,
    required this.serviceSubName,
    required this.serviceImage,
    required this.isbool,
  });

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
                    child: Image.asset(serviceImage),
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
                              serviceName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              serviceSubName,
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
                                    child: Text('$serviceQuantity' + ' KG'),
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
                          : Row(
                              children: [
                                Text('\$ ' + '$servicePrice'),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('$serviceQuantity' + ' KG'),
                              ],
                            ),
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
                      : Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  onDelete();
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 30,
                                width: 80,
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
                                        Icons.remove,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      Text('5 KG'),
                                      Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
