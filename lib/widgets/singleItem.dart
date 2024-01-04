import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_and_recycle_application/providers/review_service_provider.dart';
import 'package:waste_management_and_recycle_application/widgets/count.dart';

class SingleItem extends StatefulWidget {
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
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  late ReviewServiceProvider reviewServiceProvider;
  late int count;
  getCount() {
    setState(() {
      count = widget.serviceQuantity;
    });
  }

  @override
  void initState() {
    getCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //getCount();
    reviewServiceProvider = Provider.of(context);
    reviewServiceProvider.getReviewCartData();
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
                    child: Image.asset(widget.serviceImage),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: widget.isbool == false
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Text(
                              widget.serviceName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.serviceSubName,
                            ),
                          ],
                        ),
                      ),
                      widget.isbool == false
                          ? InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    backgroundColor:
                                        Color.fromARGB(255, 165, 248, 165),
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          ListTile(
                                            leading: Icon(
                                              Icons.star_purple500_outlined,
                                            ),
                                            iconColor: Color.fromARGB(
                                                255, 86, 161, 71),
                                            title: new Text('5 KG'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(
                                              Icons.star_purple500_outlined,
                                            ),
                                            iconColor: Color.fromARGB(
                                                255, 86, 161, 71),
                                            title: new Text('10 KG'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(
                                              Icons.star_purple500_outlined,
                                            ),
                                            iconColor: Color.fromARGB(
                                                255, 86, 161, 71),
                                            title: new Text('20 KG'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(
                                              Icons.star_purple500_outlined,
                                            ),
                                            iconColor: Color.fromARGB(
                                                255, 86, 161, 71),
                                            title: new Text('> 20 KG'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Container(
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
                                      child: Text(
                                          '${widget.serviceQuantity}' + ' KG'),
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
                            )
                          : Row(
                              children: [
                                Text('\$ ' + '${widget.servicePrice}'),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('${widget.serviceQuantity}' + ' KG'),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: widget.isbool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: widget.isbool == false
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
                                InkWell(
                                  onTap: () {
                                    if (count == 5) {
                                      Fluttertoast.showToast(
                                        msg: 'You reach minimum limit',
                                        backgroundColor:
                                            Color.fromARGB(255, 165, 248, 165),
                                      );
                                    } else {
                                      setState(() {
                                        count -= 5;
                                      });
                                      reviewServiceProvider
                                          .updateReviewServiceData(
                                        cartID: widget.serviceId,
                                        cartImage: widget.serviceImage,
                                        cartName: widget.serviceName,
                                        cartPrice:
                                            widget.servicePrice ~/ (count ~/ 5),
                                        cartQuantity: count,
                                      );
                                    }
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                                Text(' $count KG'),
                                InkWell(
                                  onTap: () {
                                    if (count >= 0) {
                                      setState(() {
                                        count += 5;
                                      });
                                      reviewServiceProvider
                                          .updateReviewServiceData(
                                        cartID: widget.serviceId,
                                        cartImage: widget.serviceImage,
                                        cartName: widget.serviceName,
                                        cartPrice:
                                            widget.servicePrice * (count ~/ 5),
                                        cartQuantity: count,
                                      );
                                    }
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
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
                                  widget.onDelete();
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
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 86, 161, 71),
                                  border: Border.all(color: Colors.white60),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Count(
                                        serviceQuantity: widget.serviceQuantity,
                                        serviceSubName: widget.serviceSubName,
                                        serviceId: widget.serviceId,
                                        serviceImage: widget.serviceImage,
                                        serviceName: widget.serviceName,
                                        servicePrice: widget.servicePrice,
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
        widget.isbool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black,
              ),
      ],
    );
  }
}
