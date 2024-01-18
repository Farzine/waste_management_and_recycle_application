import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/models/service_model.dart';

class ServiceProvider with ChangeNotifier {
  List<ServiceModel> serviceList = [];
  late ServiceModel serviceModel;
  List<ServiceModel> search = [];

  fatchServiceData() async {
    List<ServiceModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('Service').get();

    value.docs.forEach(
      (element) {
        serviceModel = ServiceModel(
          servicePrice: element.get('servicePrice'),
          serviceQuantity: element.get('serviceQuantity'),
          serviceId: element.get('serviceId'),
          serviceName: element.get('serviceName'),
          serviceImage: element.get('serviceImage'),
          serviceSubName: element.get('serviceSubName'),
          aboutService: element.get('aboutService'),
          serviceOption: element.get('serviceOption'),
        );
        search.add(serviceModel);

        newList.add(serviceModel);
      },
    );
    serviceList = newList;
    notifyListeners();
  }

  List<ServiceModel> get getServiceDataList {
    return serviceList;
  }

  //// search command
  List<ServiceModel> get getAllServiceSearch {
    return search;
  }
}
