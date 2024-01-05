class ReviewCartModel {
  String cartID;
  String cartImage;
  String cartName;
  String cartSubName;
  int cartPrice;
  int cartQuantity;

  ReviewCartModel({
    required this.cartSubName,
    required this.cartID,
    required this.cartImage,
    required this.cartName,
    required this.cartPrice,
    required this.cartQuantity,
  });
}
