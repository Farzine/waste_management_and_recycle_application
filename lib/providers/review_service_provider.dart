import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/models/review_service_model.dart';

class ReviewServiceProvider with ChangeNotifier {
  void addReviewServiceData({
    String? cartID,
    String? cartName,
    String? cartImage,
    String? cartSubName,
    int? cartPrice,
    int? cartQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourReviewCart')
        .doc(cartID)
        .set(
      {
        "cartID": cartID,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "cartSubName": cartSubName,
      },
    );
  }

  List<ReviewCartModel> reviewCartDataList = [];
  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];
    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourReviewCart')
        .get();
    reviewCartValue.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartSubName: element.get('cartSubName'),
        cartID: element.get('cartID'),
        cartImage: element.get('cartImage'),
        cartName: element.get('cartName'),
        cartPrice: element.get('cartPrice'),
        cartQuantity: element.get('cartQuantity'),
      );
      newList.add(reviewCartModel);
    });
    reviewCartDataList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }
}
