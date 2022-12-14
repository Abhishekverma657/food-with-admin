import 'package:flutter/cupertino.dart';

class ReviewCartModel {
  String cartId;
  String cartImage;
  String cartName;
  int cartPrice;
  int cartQuentity;
  ReviewCartModel(
      {required this.cartId,
      required this.cartImage,
      required this.cartName,
      required this.cartPrice,
      required this.cartQuentity});
}
