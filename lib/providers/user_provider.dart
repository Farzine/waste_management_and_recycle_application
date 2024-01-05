import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/models/user_model.dart';

class UserProvider with ChangeNotifier {
  void addUserData(
      {User? currentUser,
      String? userName,
      String? userImage,
      String? userEmail}) async {
    await FirebaseFirestore.instance
        .collection('userData')
        .doc(currentUser!.uid)
        .set({
      "userName": userName,
      "userEmail": userEmail,
      "userImage": userImage,
      "userUid": currentUser.uid,
    });
  }

  late UserModel currentData;
  void getUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection('userData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
        userEmail: value.get('userEmail'),
        userImage: value.get('userImage'),
        userName: value.get('userName'),
        userUid: value.get('userUid'),
      );
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel get currentUserData {
    return currentData;
  }
}
