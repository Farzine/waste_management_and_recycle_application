import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:waste_management_and_recycle_application/models/waste_type_model.dart';

class WasteTypeProvider with ChangeNotifier {
  List<WasteTypeModel> wasteTypeList = [];
  late WasteTypeModel wasteTypeModel;

  fatchWasteTypeData() async {
    List<WasteTypeModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('WasteType').get();

    value.docs.forEach(
      (element) {
        wasteTypeModel = WasteTypeModel(
          wasteTypeName: element.get('wasteTypeName'),
          wasteTypeImage: element.get('wasteTypeImage'),
          wasteTypeSubName: element.get('wasteTypeSubName'),
          wasteTypeSubTitle: element.get('wasteTypeSubTitle'),
        );

        newList.add(wasteTypeModel);
      },
    );
    wasteTypeList = newList;
    notifyListeners();
  }

  List<WasteTypeModel> get getWasteTypeDataList {
    return wasteTypeList;
  }
}
