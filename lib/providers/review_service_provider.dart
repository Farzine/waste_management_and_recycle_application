import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReviewServiceProvider with ChangeNotifier {
  void addReviewServiceData({
    String? cartID,
    String? cartName,
    String? cartImage,
    String? cartPrice,
    int? cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourReviewCart')
        .doc(cartID)
        .set({
      "cartID": cartID,
      "cartName": cartName,
      "cartImage": cartImage,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
    });
  }
}
