import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:waste_management_and_recycle_application/models/delivery_address_model.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/add_delivery_address/add_delivery_address.dart';

class CheckOutProvider with ChangeNotifier {
  bool isloading = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController alternateMobileNo = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController division = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController union = TextEditingController();
  TextEditingController village = TextEditingController();
  TextEditingController postCode = TextEditingController();
  late LocationData setLocation;
  void validator(context, addressType myType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: 'first name is empty');
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: 'last name is empty');
    } else if (mobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: 'mobile number is empty');
    } else if (alternateMobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: 'alternate mobile no is empty');
    } else if (email.text.isEmpty) {
      Fluttertoast.showToast(msg: 'email is empty');
    } else if (division.text.isEmpty) {
      Fluttertoast.showToast(msg: 'division is empty');
    } else if (district.text.isEmpty) {
      Fluttertoast.showToast(msg: 'district is empty');
    } else if (union.text.isEmpty) {
      Fluttertoast.showToast(msg: 'union is empty');
    } else if (village.text.isEmpty) {
      Fluttertoast.showToast(msg: 'village is empty');
    } else if (postCode.text.isEmpty) {
      Fluttertoast.showToast(msg: 'post code is empty');
    } else if (setLocation == null) {
      Fluttertoast.showToast(msg: 'location is empty');
    } else {
      isloading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection('AddDeliveryAddress')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'firstName': firstName.text,
        'lastName': lastName.text,
        'mobileNo': mobileNo.text,
        'alternateMobileNo': alternateMobileNo.text,
        'email': email.text,
        'division': division.text,
        'district': district.text,
        'union': union.text,
        'village': village.text,
        'postCode': postCode.text,
        'addressType': myType.toString(),
        'longitude': setLocation.longitude,
        'latitude': setLocation.latitude,
      }).then((value) async {
        isloading = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: 'Added your delivery address');
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

  List<DeliveryAddressModel> deliveryAdressList = [];
  getDeliveryAddressData() async {
    List<DeliveryAddressModel> newList = [];

    DeliveryAddressModel deliveryAddressModel;
    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection("AddDeliverAddress")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (_db.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        firstName: _db.get("firstName"),
        lastName: _db.get("lastName"),
        addressType: _db.get("addressType"),
        division: _db.get("division"),
        alternateMobileNo: _db.get("alternateMobileNo"),
        district: _db.get("district"),
        union: _db.get("union"),
        mobileNo: _db.get("mobileNo"),
        postCode: _db.get("postCode"),
        village: _db.get("village"),
        email: _db.get("email"),
      );
      newList.add(deliveryAddressModel);
      notifyListeners();
    }

    deliveryAdressList = newList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDeliveryAddressList {
    return deliveryAdressList;
  }
}
