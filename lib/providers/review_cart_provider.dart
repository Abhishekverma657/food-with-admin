// import 'dart:html';

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food/models/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  static void addReviewCartdata(String ?cartId, String cartImage, String cartName,
      int cartPrice, int cartQuentity, bool isadd) async {
         FirebaseFirestore.instance.collection("ReviewCart").doc(FirebaseAuth.instance.currentUser!.uid).collection("YourReviewCart").doc(cartId).set({
            
       "cartId":cartId,
        "cartName":cartName,
        "cartImage":cartImage,
        "cartPrice":cartPrice,
        "cartQuentity":cartQuentity,
         "isadd":isadd

         });
      }


        List<ReviewCartModel>reviewCartDataList=[];
         getReviewCartData() async{
           List<ReviewCartModel>newList=[];
        QuerySnapshot reviewCartValue= await    FirebaseFirestore.instance.collection("ReviewCart").doc(FirebaseAuth.instance.currentUser!.uid).collection("YourReviewCart").get();
         reviewCartValue.docs.forEach((element) { 
           ReviewCartModel reviewCartModel=ReviewCartModel(
            cartId: element.get("cartId"),
            cartImage:  element.get("cartImage"), 
            cartName: element.get("cartName"),
            cartPrice:  element.get("cartPrice"),

            cartQuentity: element.get("cartQuentity"),
            );
             newList.add(reviewCartModel);
         });
          reviewCartDataList=newList;
          notifyListeners();
         }
          
         List<ReviewCartModel>  get getReviewCartDataList{
            return reviewCartDataList;
          }

           ///////////////////delete //////
           ///
         reviewCartDatadelete(cartId){
           FirebaseFirestore.instance.collection("ReviewCart").doc(FirebaseAuth.instance.currentUser!.uid).collection("YourReviewCart").doc(cartId).delete();
            notifyListeners();
         }

          // getaddAndQuantity(){
          //   FirebaseFirestore.instance.collection("ReviewCart").doc(FirebaseAuth.instance.currentUser!.uid).collection("YourReviewCart").get().then((value) => {
          //      value.docs.forEach((element) {
                 
          //      })
          //   });
          // }
}
